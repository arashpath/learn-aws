#!/bin/bash
Region="ap-south-1" # Choosing AWS Region Mumbai
zones=$( # Getting all AvailabilityZones in that Region
    aws ec2 describe-availability-zones --region $Region \
        --query 'AvailabilityZones[*].ZoneName' 
)

print_align() { # Function to Print and save to a file
    printf "%30s=%s\n" "$1" "${!1}" | tee -a ./vpc.info
}

VpcId=$( # Createing a VPC -------------------------------------------- Step 01
#    aws ec2 describe-vpcs --query 'Vpcs[?(!IsDefault)].VpcId' # To test
    aws ec2 create-vpc --cidr-block 10.0.0.0/16 --query 'Vpc.VpcId'
); print_align VpcId

t=0; for type in pub pvt; do # Create public and private subnets ------ Step 02
    z=0; for zone in $zones; do # A subnet in each zone 
        eval  $type"_"${zone##*-}=$(
            aws ec2 create-subnet --vpc-id $VpcId \
                --cidr-block 10.0.$(($t+$z)).0/24 \
                --query 'Subnet.SubnetId'
        ); ((z++)); print_align $type"_"${zone##*-}
    done; ((t+=10)) 
done

igw=$( # Create a internet gateway and attache it to VPC -------------- Step 03 
    aws ec2 create-internet-gateway \
        --query 'InternetGateway.InternetGatewayId'
); print_align igw 
aws ec2 attach-internet-gateway --internet-gateway-id $igw --vpc-id $VpcId

rtable=$( # Create routing table and routes --------------------------- Step 04 
    aws ec2 create-route-table --vpc-id $VpcId \
        --query 'RouteTable.RouteTableId'
); print_align rtable
aws ec2 create-route --route-table-id $rtable \
    --destination-cidr-block 0.0.0.0/0 --gateway-id $igw # ig route
for zone in $zones; do # Add internet to all public subnet
    aws ec2 associate-route-table --route-table-id $rtable \
        --subnet-id $(eval echo \$pub_${zone##*-})
done

#aws ec2 run-instances --image-id ami-0937dcc711d38ef3f --count 1 --instance-type t2.micro --key-name test-key --security-group-ids sg-af7a50c8 --subnet-id subnet-3b839262 --associate-public-ip-address
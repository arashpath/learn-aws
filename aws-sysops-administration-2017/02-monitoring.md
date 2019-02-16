### 02 Monitoring Metrics Analysis

#### 007 CloudWatch Introduction
>Amazon CloudWatch is a monitoring service to monitor your AWS resources, as well as the applications that you run on AWS.

CloudWatch can monitor things like:
- Compute
  - Autoscaling Group
  - Elastic Load Balancers
  - Route53 Health Checks
- Storage & Content Delivery
  - EBS Volumes
  - Storage Gateways
  - CloudFront
- Others
  - SNS Topics
  - SQS Queues
  - Opsworks
  - CloudWatch Logs
  - Estimated Charges on your AWS Bill

CloudWatch and EC2 
- https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/viewing_metrics_with_cloudwatch.html
> RAM Utilization is a custom metric!
  By default EC2 monitoring is 5 minute intervals, unless detailed monitoring is enabled (1 minute intervals)
- Host level metrics consist of
  - CPU
  - Network
  - Disk
  - Status Check
> CloudWatch Metrics is stored for 2 weeks bu Default
  Can retrieve data that is longer than 2 weeks using the GetMetricStatistics API or by using third party tools offered by AWS partners.

> Can retrieve data from any terminated EC2 or ELB instance for up to 2 weeks after it's termination.

> Many default metrics for many default services are i minute, but it can be 3 or 5 minutes depending on the services.

> For custom metrics the minimum granularity that you can have is 1 minute.

> **CloudWatch Alarms**  can be created to monitor any metric and set appropriate thresholds to trigger alarms and also set what actions should be taken if an alarm state is reached. 

#### 008 EC2 Status Checks
- System Status Check (Checks Host)
  - Loss of network connectivity
  - Loss of system power
  - Software issues on the physical host
  - Hardware issues on the physical host
  - Best way to resolve issues is to stop and then start the VM again.
- Instance Status Check (Checks VM)
  - Failed system status checks
  - Misconfigured networking or startup configuration
  - Exhausted memory
  - Corrupted file system
  - Incompatible kernel
  - Best way to trouble shoot is by rebooting the instance or by making modifications in your operating systems.

#### 009 Creating A CloudWatch Role - Lab
- IAM > Roles > Create role > AWS service > EC2
  - CloudWatchFullAccess
 
#### 010 Monitoring EC2 with Custom Matrices - Lab

##The Content

>The AWS DevOps Engineer Professional focuses on fewer AWS services than the SA Pro (which is very wide reaching) but for the services it does focus on you’ll need to know them inside out.

Bear in mind that the format of the exam can change at any time but areas I’d recommend to concentrate on would be:

- Autoscaling.
  - Understand autoscaling inside and out.
  - Make sure you know the differences between deploying with and without Cloudformation (as there are some deployment methods you can do with Cloudformation that you can’t without) and the command or JSON syntax to perform them.
  - Understand lifecycle hooks and the autoscaling stages they run in
  - Understand launch configurations and how they work and are updated (hint: You must replace them)
  - Understand why you may need to place an instance into STANDBY state
- Elastic Beanstalk.
  - You’ll need to know this to an advanced level.
  - Understand what stacks Beanstalk supports natively and how you would deploy a stack it doesn’t (hint: Use Docker).
  - Understand the differences between a single Docker deployment v’s multiple Docker deployments.
  - Understand how .eb extensions work and the syntax of each of the files and how you’d make custom modifications to your beanstalk container.
  - Make sure you know the “eb” command line and can spot “fake” commands
- Opsworks
  - As with Elastic Beanstalk you’ll need to know this to a solid depth
  - Understand Opsworks concepts (stacks/layers/applications) and the properties of each
  - Understand that Opsworks uses chef and make sure you know the different deployment lifecycle states and when they are each run
  - Understand the differences between Windows and Linux stacks
  - Understand how Opsworks actually works and the different style (and limitations) of autoscaling it uses
  - Understand Opsworks monitoring and how this differs slightly from native Cloudwatch metrics for EC2 instances
- Deployment Methodologies
  - You’ll need to understand the different deployment methods for blue/green and the pro/cons of each.  Simply watch this video and understand it. Its all you’ll need: Deep Dive into Blue/Green Deployments on AWS
- Cloudformation
  - You won’t need to memorise every single command in Cloudformation but ensure you understand the different sections of the templates and the syntax
  - Understand fully cloudformation::init and cfn-init
  - Understand Creationpolicy and cfn-signal
  - Understand Waitcondition and handles and the difference between when to use these v’s Creationpolicy
  - Understand how to use Cloudformation with auto-scaling deployments (memorise the commands for this section)
  - Know what each of the fn::* commands is used for within a template
  - Understand stack policies, when to use them and what they do
- Cloudwatch
  - Know what Cloudwatch is used for and how it works
  - Make sure you know the difference between a namespace, metric and a dimension and how they relate to each other
  - Understand Cloudwatch logs.  Specifically know what the following are: log event, log stream, log group, metric filter, retention settings
  - Remember that Cloudwatch only keeps data for 14 days but Cloudwatch logs keeps data indefinitely (by default)
  - Understand how you can set up alerting within Cloudwatch and which endpoints you can send them to
- Cloudtrail
  - Make sure you know what Cloudtrail is, what it can be used for and how it can be setup (including how to configure it globally)
  - Understand the default encryption for the logs in S3 (SSE-S3) and that they can use KMS if desired and why you may want to do this
  - Know hash verification, integration with SNS and Cloudwatch logs and how to set each of those up
  - Realise you can have up to 5 trails per region

In addition to the above you may have the odd question or two covering a service not listed in the above (relating to a core service) so you’ll need to have a basic overview of these but those I’ve listed require knowledge to a deep level.
Studying

To check my level of pre-revision knowledge I firstly read the exam blueprint and attempted the sample questions.  Having found these questions not too difficult I decided to take the practice exam and passed with 65%.

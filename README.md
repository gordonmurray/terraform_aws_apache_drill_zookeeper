# Terraform AWS Apache Drill & Zookeeper
An Apache Drill cluster with Zookeeper on AWS using Terraform

Use Packer and Terraform to create a 3 node ARM based Apache Drill v1.20.2 cluster with a single ARM based node Apache Zookeeper v3.8.0.

![Apache Drill bits](https://github.com/gordonmurray/terraform_aws_apache_drill_zookeeper/blob/main/files/apache_drill_cluster.png?raw=true)

### Requirements

* AWS Credentials
* Packer - https://www.packer.io/
* Terraform - https://www.terraform.io/

### Usage

Update the variables in packer/variables.json and then use Packer to create an AMI:

```
cd packer
packer build --var-file=variables.json drill.json
packer build --var-file=variables.json zookeeper.json

```

This will create AMIs in your account that Terraform can use to create EC2 instances.

Update the variables in terraform.tfvars and then run Terraform:

```
terraform init
terraform apply
```

### Cost estimate

```
Project: gordonmurray/terraform_aws_apache_drill_zookeeper

 Name                                                  Monthly Qty  Unit   Monthly Cost 
                                                                                        
 aws_instance.drill[0]                                                                  
 ├─ Instance usage (Linux/UNIX, on-demand, r6g.large)          730  hours        $73.58 
 └─ root_block_device                                                                   
    └─ Storage (general purpose SSD, gp3)                      100  GB            $8.00 
                                                                                        
 aws_instance.drill[1]                                                                  
 ├─ Instance usage (Linux/UNIX, on-demand, r6g.large)          730  hours        $73.58 
 └─ root_block_device                                                                   
    └─ Storage (general purpose SSD, gp3)                      100  GB            $8.00 
                                                                                        
 aws_instance.drill[2]                                                                  
 ├─ Instance usage (Linux/UNIX, on-demand, r6g.large)          730  hours        $73.58 
 └─ root_block_device                                                                   
    └─ Storage (general purpose SSD, gp3)                      100  GB            $8.00 
                                                                                        
 aws_instance.zookeeper                                                                 
 ├─ Instance usage (Linux/UNIX, on-demand, r6g.large)          730  hours        $73.58 
 └─ root_block_device                                                                   
    └─ Storage (general purpose SSD, gp3)                      100  GB            $8.00 
                                                                                        
 OVERALL TOTAL                                                                  $326.34 
──────────────────────────────────
18 cloud resources were detected:
∙ 4 were estimated, all of which include usage-based costs, see https://infracost.io/usage-file
∙ 14 were free:
  ∙ 11 x aws_security_group_rule
  ∙ 2 x aws_security_group
  ∙ 1 x aws_key_pair
```
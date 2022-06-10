# packer-ami
packer template

Cloud Infrastructure AMI automation 
Objective: -
This document can be used to build complete CI-CD to automate AMI baking process.

Components and tools used:-

AWS Cloud provider
Two instances with below listed supportive tools installed in it. 
Jenkins, Packer, git, AWS cli(instance 1)
Vault server configuration(instance 2)

Step1:- 
launch instance1 through console and follow below link to install packer 
https://www.packer.io/downloads

packer version:-1.7.8

Step2:- 
Install Jenkins & git in instance 1 follow below link to configure jenkins 

https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/jenkins-ubuntu-20-install-git-jdk-java-ci-cd
Step3:- configure vault using below steps
https://github.com/gul7491/packer-ami/blob/b8b72dbb99e8ae6de83201e106a18f9686e233ea/vault%20installation.txt

perform below 
login to vault and enable aws engine
 
click on configuration
 
set lease and iam credential 
 
create role
 
policy 

{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "ec2:AttachVolume",
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:CopyImage",
                "ec2:CreateImage",
                "ec2:CreateKeypair",
                "ec2:CreateSecurityGroup",
                "ec2:CreateSnapshot",
                "ec2:CreateTags",
                "ec2:CreateVolume",
                "ec2:DeleteKeyPair",
                "ec2:DeleteSecurityGroup",
                "ec2:DeleteSnapshot",
                "ec2:DeleteVolume",
                "ec2:DeregisterImage",
                "ec2:DescribeImageAttribute",
                "ec2:DescribeImages",
                "ec2:DescribeInstances",
                "ec2:DescribeInstanceStatus",
                "ec2:DescribeRegions",
                "ec2:DescribeSecurityGroups",
                "ec2:DescribeSnapshots",
                "ec2:DescribeSubnets",
                "ec2:DescribeTags",
                "ec2:DescribeVolumes",
                "ec2:DetachVolume",
                "ec2:GetPasswordData",
                "ec2:ModifyImageAttribute",
                "ec2:ModifyInstanceAttribute",
                "ec2:ModifySnapshotAttribute",
                "ec2:RegisterImage",
                "ec2:RunInstances",
                "ec2:StopInstances",
                "ec2:TerminateInstances"
            ],
            "Resource": "*"
        }
    ]
}

click on generate it will create one user in your aws account




 
 

Once vault setup completed login to vault instance run below commands to validate your configuration using below commands
Vault status 
vault read aws/creds/my-role
vault read aws/roles/my-role
1.	you will get an output below format 



Key                Value
1.	lease_id           aws/creds/my-role/K2***********kAXQ
2.	lease_duration     768h
3.	lease_renewable    true
4.	access_key         AK*************7
5.	secret_key         Y*********************Ef
6.	security_token     <nil>
Step 4:-
Login to Jenkins server and set the vault server ip and root token to env and create Jenkins pipeline and run the job. Once job ran successfully it will share the customized AMI to aws cloud.
 
** purpose** 
 create CI-CD to bake the AMI 

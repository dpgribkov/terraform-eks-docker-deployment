# Terraform project to provision an EKS cluster

Brief description. Here is the set of terraform files that will allow provision EKS cluster on AWS.

vpc.tf -- provisioning new vpc for the cluster. I'm using vpc terraform module, creating private and public subnets, taking in account that you should never expose worker nodes on the public subnets, but instead utilize set of load balancers to achieve desired connection options.

eks-cluster.tf -- describing EKS cluster structure. Terraform conviniently provides eks module for that task. Providing neccesarry details for vpc config and declaring worker groups to support scaling with asg, also attaching security groups required for connectivity declared in security-groups.tf

kubernetes.tf -- placeholder k8s provider config to be able to finidh EKS provisioning

variables.tf -- to store global variables for deployment

outputs.tf -- for printing out provisioning outputs to the terminal, in this case used for configuring kubectl context to be able to acces the cluster.
Service level deployment with terraform.

I have used sample docker-compose guestbook app. 
There is a kompose.io tool to convert docker-compose files to k8s manifests, that way we don't need to rely on kubectl do deploy dockerized apps and use the advantages of the Terraform.

The kubernetes.tf set up to deploy on previously created EKS cluster.
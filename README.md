Sample EKS cluster provisioning with terrafrom and deployment of a dockerized guestbook app.

It is a good practice to separate infrastructure and service level deployments in different terraform projects, therefore you can find two terraform projects in this repository:
-- terraform-eks-provision
-- terraform-service-deployment

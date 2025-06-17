
#  #Threetier-Application

Welcome to the **#Threetier-Application** repository! This challenge is designed for the  to get hands-on experience deploying a **Three-Tier Web Application** using **ReactJS**, **NodeJS**, and **MongoDB** on **AWS EKS**.

Merged Pull Requests will win exciting prizes! 



##  Resources


##  Prerequisites

- Basic knowledge of Docker, Kubernetes, and AWS
- An active AWS account with appropriate permissions



##  Challenge Structure

```
.
├── Application/
├── Jenkins-Pipeline/
├── Terraform/
└── Kubernetes/
```



###  Application Code

This folder contains the full-stack application:

- **Frontend:** ReactJS  
- **Backend:** NodeJS  
- **Database:** MongoDB  



###  Jenkins Pipeline Code

CI/CD automation scripts using **Jenkins declarative pipeline** to build, test, and deploy the application.



###  Jenkins Server Terraform

Terraform scripts to **provision a Jenkins server** on AWS EC2 instance for automation and orchestration.



###  Kubernetes Manifests Files

Contains the YAML files required to deploy the three-tier application to an **AWS EKS cluster**.



##  Tools Explored

- **AWS CLI**, **Terraform** – for Infrastructure as Code
- **Jenkins**, **SonarQube**, **Helm**, **Kubectl**
- **Prometheus & Grafana** – for Monitoring
- **ArgoCD** – for GitOps Deployment



##  High-Level Architecture

1. Create IAM users and policies
2. Provision Jenkins using Terraform
3. Setup EKS Cluster
4. Build and push Docker images to **ECR**
5. Use **Helm Charts** for monitoring stack
6. Deploy application using **Kubernetes Manifests**
7. GitOps with **ArgoCD** for seamless deployment



## 🛠 Getting Started – Step by Step

###  Step 1: IAM User Setup

```bash
Create IAM User: eks-admin
Attach Policy: AdministratorAccess
Generate Access Keys
```



###  Step 2: Launch EC2 Ubuntu Instance

```bash
Region: us-west-2
Connect via SSH from your local machine
```



###  Step 3: Install AWS CLI

```bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin --update
aws configure
```



###  Step 4: Install Docker

```bash
sudo apt-get update
sudo apt install docker.io
docker ps
sudo chown $USER /var/run/docker.sock
```



###  Step 5: Install kubectl

```bash
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client
```



###  Step 6: Install eksctl

```bash
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
sudo mv /tmp/eksctl /usr/local/bin
eksctl version
```



###  Step 7: Create EKS Cluster

```bash
eksctl create cluster   --name three-tier-cluster   --region us-west-2   --node-type t2.medium   --nodes-min 2   --nodes-max 2

aws eks update-kubeconfig --region us-west-2 --name three-tier-cluster
kubectl get nodes
```



###  Step 8: Apply Kubernetes Manifests

```bash
kubectl create namespace workshop
kubectl apply -f .
# To delete
kubectl delete -f .
```



###  Step 9: Setup AWS Load Balancer IAM Policy

```bash
curl -O https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/install/iam_policy.json

aws iam create-policy   --policy-name AWSLoadBalancerControllerIAMPolicy   --policy-document file://iam_policy.json

eksctl utils associate-iam-oidc-provider   --region=us-west-2   --cluster=three-tier-cluster   --approve

eksctl create iamserviceaccount   --cluster=three-tier-cluster   --namespace=kube-system   --name=aws-load-balancer-controller   --role-name AmazonEKSLoadBalancerControllerRole   --attach-policy-arn=arn:aws:iam::YOUR_AWS_ACCOUNT_ID:policy/AWSLoadBalancerControllerIAMPolicy   --approve   --region=us-west-2
```



###  Step 10: Install AWS Load Balancer Controller

```bash
sudo snap install helm --classic
helm repo add eks https://aws.github.io/eks-charts
helm repo update eks

helm install aws-load-balancer-controller eks/aws-load-balancer-controller   -n kube-system   --set clusterName=three-tier-cluster   --set serviceAccount.create=false   --set serviceAccount.name=aws-load-balancer-controller

kubectl get deployment -n kube-system aws-load-balancer-controller

kubectl apply -f full_stack_lb.yaml
```



##  Cleanup

```bash
# Delete the EKS Cluster
eksctl delete cluster --name three-tier-cluster --region us-west-2

# Stop or Terminate EC2 instance
# Delete Load Balancer from EC2 Console
# Delete any created Security Groups manually
```



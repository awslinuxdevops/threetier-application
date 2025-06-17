# 🚀 #Threetier-Application

Welcome to the **#Threetier-application** repository! This challenge is designed for the  to get hands-on experience deploying a **Three-Tier Web Application** using **ReactJS**, **NodeJS**, and **MongoDB** on **AWS EKS**.

Merged Pull Requests will win exciting prizes! 

---

##  Resources


---

##  Prerequisites

- Basic knowledge of Docker, Kubernetes, and AWS
- An active AWS account with appropriate permissions

---

##  Challenge Structure

├── application/
├── jenkins-server/
├── kubernetes/
└── terraform/


---

###  Application Code

This folder contains the full-stack application:

- **Frontend:** ReactJS  
- **Backend:** NodeJS  
- **Database:** MongoDB  

---

###  Jenkins Pipeline Code

CI/CD automation scripts using **Jenkins declarative pipeline** to build, test, and deploy the application.

---

###  Jenkins Server Terraform

Terraform scripts to **provision a Jenkins server** on AWS EC2 instance for automation and orchestration.

---

###  Kubernetes Manifests Files

Contains the YAML files required to deploy the three-tier application to an **AWS EKS cluster**.

---

##  Tools Explored

- **AWS CLI**, **Terraform** – for Infrastructure as Code
- **Jenkins**, **SonarQube**, **Helm**, **Kubectl**
- **Prometheus & Grafana** – for Monitoring
- **ArgoCD** – for GitOps Deployment

---

##  High-Level Architecture

1. Create IAM users and policies
2. Provision Jenkins using Terraform
3. Setup EKS Cluster
4. Build and push Docker images to **ECR**
5. Use **Helm Charts** for monitoring stack
6. Deploy application using **Kubernetes Manifests**
7. GitOps with **ArgoCD** for seamless deployment

---

## 🛠 Getting Started – Step by Step

###  Step 1: IAM User Setup

```bash
Create IAM User: eks-admin
Attach Policy: AdministratorAccess
Generate Access Keys
```

###  Step 2: Launch EC2 Ubuntu Instance
```
Region: us-west-2
Connect via SSH from your local machine
```

###  Step 3: Install AWS CLI
```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo apt install unzip
unzip awscliv2.zip
sudo ./aws/install -i /usr/local/aws-cli -b /usr/local/bin --update
aws configure
```

###  Step 4: Install Docker
```
sudo apt-get update
sudo apt install docker.io
docker ps
sudo chown $USER /var/run/docker.sock
```


###  Step 5: Install kubectl

```
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client

```
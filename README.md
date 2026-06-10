# DevOps Monitoring & Deployment Project (Module 8)
👨‍💻 Project Overview

This project demonstrates a complete DevOps Monitoring and Deployment pipeline using modern tools and cloud infrastructure. The system provisions an AWS EC2 instance using Terraform, deploys a monitoring stack using Docker, and automates deployment using GitHub Actions CI/CD.

The monitoring stack includes:

Grafana (Visualization Dashboard)
Loki (Log Aggregation)
Promtail (Log Shipping Agent)
Node Exporter (System Metrics)

# Architecture
GitHub Repository
        |
        | (GitHub Actions CI/CD)
        v
Terraform (Infrastructure as Code)
        |
        v
AWS EC2 Instance (Ubuntu)
        |
        v
Docker Compose
        |
        v
Monitoring Stack:
  - Grafana (Port 3000)
  - Loki (Port 3100)
  - Node Exporter (Port 9100)
  - Promtail

# Tools & Technologies Used
AWS EC2
Terraform (Infrastructure as Code)
Docker & Docker Compose
Grafana
Loki
Promtail
Node Exporter
GitHub Actions (CI/CD)
Ubuntu Server

# Infrastructure Setup (Terraform)

Terraform is used to automatically provision:

EC2 instance (t2.micro)
Security Group with required ports:
22 (SSH)
3000 (Grafana)
3100 (Loki)
9100 (Node Exporter)

# Deploy Infrastructure
cd terraform
terraform init
terraform apply

# Monitoring Stack Setup

A bash script (install.sh) is executed via EC2 user_data to install Docker and run monitoring services.

Services Running:
Service	Port
Grafana	3000
Loki	3100
Node Exporter	9100

# Grafana Dashboard

Grafana is used to visualize system metrics.

Metrics Included:
CPU Usage
Memory Usage
Disk Usage
Network Traffic

# Access: 
http://18.141.56.242:3000

# Loki Log Monitoring

Loki is used for centralized log collection.

Verification:
/ready endpoint returns ready
/metrics endpoint provides system metrics
Logs are collected via Promtail

# CI/CD Pipeline (GitHub Actions)

A GitHub Actions pipeline is configured to:

Validate Terraform configuration
Deploy infrastructure automatically on push to main
Workflow File:
.github/workflows/deploy.yml

# Deployment Steps
1. Clone repository
git clone https://github.com/MirajHossain/module-8-devops-monitoring-assignment.git

2. Configure AWS credentials
3. Deploy infrastructure
Bash Command:
cd terraform
terraform init
terraform apply
4. Access services using EC2 Public IP
   
# Screenshots
Terraform apply success:
<img width="1204" height="1600" alt="WhatsApp Image 2026-06-10 at 4 58 35 PM" src="https://github.com/user-attachments/assets/16a28d5c-21b8-4e3a-94bd-357b20b1754e" />
Grafana dashboard:
<img width="1909" height="991" alt="Grafana_dashboard" src="https://github.com/user-attachments/assets/ca96bb0b-02ab-44b4-ad4b-4f923bea5462" />
Loki logs: 
<img width="1532" height="658" alt="Loki_matrics" src="https://github.com/user-attachments/assets/785a46cb-87ef-4550-ac2f-fe26de1eb79f" /> 
Node Exporter metrics: 
<img width="1913" height="524" alt="Node_exporter_matrics_running" src="https://github.com/user-attachments/assets/de8b6f1c-0907-4667-9b71-539bb8571503" />



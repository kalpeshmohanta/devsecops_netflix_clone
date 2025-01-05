<div align="center">
  <br>
  <a href="http://netflix-clone-with-tmdb-using-react-mui.vercel.app/">
    <img src="https://upload.wikimedia.org/wikipedia/commons/0/08/Netflix_2015_logo.svg" alt="Netflix Logo" width="100" height="32">
  </a>
</div>


# DEVsecops Netflix Clone Project

This project is a Netflix clone built with a focus on DevOps and security best practices. The project is divided into two main directories: `terraform` and `code`.

## Getting Started

### Prerequisites

- Terraform installed
- AWS CLI configured
- Docker installed
- Node.js and npm installed

### Installation

1. **Terraform Setup**:
---
- Create `jenkins-ec2 1st`
- Then, create `monitor-ec2 2nd`, as it uses same VPC & Subnet from `jenkins-ec2 from 1st`
---
   - Navigate to the `terraform` directory.
   - Run `terraform init` to initialize the Terraform configuration.
   - Run `terraform apply` to create the infrastructure on AWS.
   - Run `terraform destroy` to destroy all infrastructure on AWS which is created by Terraform

2. **Code Setup**:
   - Navigate to the `code` directory.
   - Run via Dockerfile or docker-compose.

### Usage

- After setting up the infrastructure and running the application, you can access the Netflix clone via the provided URL in Dockerfile or localhost.

### Acknowledgments

- Inspiration from Netflix

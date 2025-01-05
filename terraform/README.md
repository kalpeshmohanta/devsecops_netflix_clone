# Netflix Clone - Task 1

## AWS Resources with Terraform

### Step 1: Configure Terraform

1. **Install Terraform**: 
   - Update package list and install Terraform.
2. **Initialize Terraform**: 
   - Run `terraform init` to initialize the working directory.

### Step 2: Define Terraform Configuration

#### Configuration Details:

1. **Provider**:
   - AWS Region: `ap-south-1`.

2. **VPC**:
   - Create a new VPC named `kalpesh-vpc`.
   - Assign CIDR block: `10.0.0.0/16`.

3. **Security Group**:
   - Create a security group with the following rules:
     - Allow SSH (Port 22) from `0.0.0.0/0`.
     - Allow HTTP (Port 80) from `0.0.0.0/0`.
     - Allow HTTPS (Port 443) from `0.0.0.0/0`.
   - Attach this security group to the VPC.

4. **EC2 Instance**:
   - Name: `netflix-jenkins`.
   - AMI: `ami-053b12d3152c0cc71` (Ubuntu).
   - Instance Type: `t2.large`.
   - Key Pair: `aws_key_pair.pem`.
   - Attach the created security group.
   - Configure root block storage:
     - Size: `30 GiB`.
     - Volume Type: `gp2`.
     - Enable Delete on Termination.

5. **Elastic IP**:
   - Allocate and associate an Elastic IP to the EC2 instance.

6. **EC2 Instance for monitoring** 
   
   - Using same VPC & Subnet from `Jenkins Instance`
   ---
   - Name: `netflix-monitoring`.
   - AMI: `ami-053b12d3152c0cc71` (Ubuntu).
   - Instance Type: `t2.medium`.
   - Key Pair: `aws_key_pair.pem`.
   - Attach the created security group.
   - Configure root block storage:
     - Size: `20 GiB`.
     - Volume Type: `gp2`.
     - Enable Delete on Termination.

5. **Elastic IP**:
   - Allocate and associate an Elastic IP to the EC2 instance.

### Comments:
- Use variables for parameters like region, instance type, and volume size for flexibility.
- Ensure proper tagging for resources for better organization.
- Verify security group rules are aligned with project requirements.
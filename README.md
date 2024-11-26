# AWS Infrastructure Deployment with Terraform and GitHub Actions

## **Overview**
This project demonstrates the deployment of AWS infrastructure using Terraform, integrated with GitHub Actions to automate the deployment process. Additionally, it incorporates `Checkov` for compliance and security checks of Terraform code.

---

## **Environment Setup**

### **Prerequisites**

1. **AWS Account**:
   - Ensure you have access to an AWS account with permissions to manage resources such as VPC, EC2, and IAM.

2. **IAM Roles and Policies**:
   - Create an IAM User/Role with the following permissions:
     - `AmazonEC2FullAccess`
     - `AmazonS3FullAccess`
     - `IAMFullAccess`
     - `CloudWatchFullAccess`

3. **Terraform**:
   - Install Terraform on your local machine.
     ```bash
     # On Ubuntu/Debian
     sudo apt-get update && sudo apt-get install -y terraform
     ```
   - Verify installation:
     ```bash
     terraform --version
     ```

4. **GitHub Repository**:
   - Create a repository for this project and clone it locally:
     ```bash
     git clone <your-repository-url>
     cd <your-repository>
     ```

5. **GitHub Actions Configuration**:
   - Ensure the repository has GitHub Actions enabled.

6. **Checkov**:
   - Install Checkov locally for pre-commit checks.
     ```bash
     pip install checkov
     ```

---

## **Project Structure**

```plaintext
project-directory/
|— README.md            # Documentation
|— main.tf              # Terraform configuration file
|— variables.tf         # Input variables for Terraform
|— outputs.tf           # Outputs of Terraform resources
|— provider.tf          # Provider configuration for AWS
|— .github/
    ├── workflows/
        └── terraform.yml  # GitHub Actions workflow

```

### **File Details**

1. **`main.tf`**: Contains the Terraform configuration for deploying AWS resources.
2. **`variables.tf`**: Defines input variables such as VPC CIDR block, instance type, and key pair.
3. **`outputs.tf`**: Specifies the outputs for resources like VPC ID, Subnet IDs, and EC2 instance public IP.
4. **`.github/workflows/terraform.yml`**: Automates the deployment process using GitHub Actions.

---

## **Steps to Set Up and Run**

### **1. Clone the Repository**
```bash
git clone <your-repository-url>
cd <your-repository>
```

### **2. Configure Terraform Backend (Optional)**
If using a remote backend for Terraform state, update the `backend` block in `main.tf`:
```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "terraform/state"
    region         = "us-east-1"
  }
}
```

### **3. Initialize and Plan Terraform Locally**
To ensure everything is configured correctly, initialize Terraform and preview the changes:
```bash
terraform init
terraform plan
```

### **4. Add Secrets to GitHub Repository**
In your GitHub repository:
1. Navigate to **Settings > Secrets and variables > Actions**.
2. Add the following secrets:
   - **`AWS_ACCESS_KEY_ID`**: Your AWS access key ID.
   - **`AWS_SECRET_ACCESS_KEY`**: Your AWS secret access key.

### **5. Push Code to GitHub**
```bash
git add .
git commit -m "Add Terraform configuration and GitHub Actions workflow"
git push origin main
```

### **6. Trigger GitHub Actions Workflow**
Upon pushing the code, the `terraform.yml` workflow is triggered automatically to deploy the infrastructure.

---

## **Validation and Testing**

### **1. Validate Terraform Code**
Use `terraform validate` to ensure the syntax and structure are correct:
```bash
terraform validate
```

### **2. Run Checkov Locally**
Check for compliance and security issues in the Terraform code:
```bash
checkov -d .
```

### **3. Verify GitHub Actions Workflow**
In your GitHub repository:
1. Navigate to **Actions**.
2. Check the status of the `Terraform Deployment` workflow.

---

## **Checking Results**

### **1. Verify AWS Resources**
1. **VPC**:
   - Navigate to **VPC > Your VPCs** in the AWS Management Console.
   - Verify the VPC with the specified CIDR block exists.

2. **Subnets**:
   - Check **VPC > Subnets** for public and private subnets.

3. **NAT Gateway**:
   - Verify the NAT Gateway under **VPC > NAT Gateways**.

4. **EC2 Instances**:
   - Navigate to **EC2 > Instances**.
   - Verify the instance is running with the correct security groups and key pair.

### **2. View Terraform Outputs**
Run the following command locally to see the deployed resource details:
```bash
terraform output
```

---

## **Troubleshooting**

### **1. GitHub Actions Workflow Fails**
- Review the logs in the **Actions** tab of your repository.
- Check for common issues like missing secrets or invalid Terraform syntax.

### **2. Deployment Issues**
- Run `terraform plan` locally to identify configuration errors.
- Ensure AWS service quotas are not exceeded.

### **3. Checkov Reports Failures**
- Review the Checkov report for compliance and security issues.
- Address any warnings or errors in the Terraform code.

---

## **Conclusion**
This project demonstrates infrastructure as code (IaC) using Terraform, automated with GitHub Actions. By integrating Checkov, it ensures compliance and security of the Terraform configurations. Modify the workflow or Terraform files as needed for your specific requirements.


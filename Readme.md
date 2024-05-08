
#Prerequisites:
	Terraform:
		Install Terraform:
		Download and install Terraform by following the instructions provided on the official Terraform website. (https://www.terraform.io/downloads.html)
	Azure CLI:
		Ensure Azure CLI is installed on your local machine. If not, you can install it by following the instructions provided on the official Azure CLI installation guide. (https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
	Ansible:
		Install Ansible:
		Install Ansible on your local machine by following the instructions provided on the official Ansible documentation. (https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

## Steps to Deploy

Clone this repository to your local machine:

   ```bash
   git clone <repository_url>


Running the Automation:
	Terraform Configuration:
	Initialize Terraform:
		a. Navigate to the directory containing the Terraform configuration files.
		cd /path/to/terraform/config
		b. Run terraform init to initialize the working directory.
		terraform init
		c. Review and Apply Configuration:
		Review the terraform.tfvars file to ensure all necessary variables are correctly set, such as Azure credentials, subscription ID, etc.
		d. Run terraform plan to see the execution plan.
		terraform plan
		e. If everything looks good, apply the configuration changes.
		terraform apply
		Type yes when prompted to confirm the action.


	Ansible Configuration:
		a. Once the Azure resources are provisioned, update the Azure dynamic inventory script with your Azure credentials and execute it to generate the 		Ansible inventory:
		./azure_rm.py --list
		b. Review and modify the deploy_mediawiki.yaml Ansible playbook as needed.
		c. Execute the Ansible playbook to deploy MediaWiki:
			ansible-playbook deploy_mediawiki.yaml
		d. Once the deployment is complete, you can access MediaWiki using the public IP address associated with the Azure Traffic Manager endpoint.

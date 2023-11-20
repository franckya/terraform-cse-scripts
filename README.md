# terraform-scripts

Initial Configuration
Create a repository with gitignore with terraform to make sure to ignore secrets files if there is any. 

Set up your environment
Login specifying your subscription ID: az login --subscription "<your-subscription-id>"
Set your subscription: az account set --subscription "<Your_Subscription_ID>"
Create and retrieve your service principal: az ad sp create-for-rbac --name <Your_Service_Principal_Name> --role Contributor --scopes /subscriptions/<Your_Subscription_ID>

Configure your environment Variable with the credentials retrieved
Set your client ID: $env:ARM_CLIENT_ID="your_client_id"
Set your client password: $env:ARM_CLIENT_SECRET="your_password"
Set your tenant ID: $env:ARM_TENANT_ID="your_tenant_id"
Set your subscription ID: $env:ARM_SUBSCRIPTION_ID="your_subscription_id"

Begin your deployment
terraform init
terraform plan
terraform apply

Destroy your deployment(if necessary): 
terraform destroy

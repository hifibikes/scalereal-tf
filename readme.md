# INTRODUCTION

Terraform Repository to perform following actions,
- AWS S3 Bucket
- IAM role with specified policies
- Lambda function to schedule Python function execution
- Dynamo DB creation
- REST API endpoint creation

# PRE-REQUISITES
Terraform 12 binary should be installed. Please follow official link for setup.


# INSTRUCTION

### Root module is present under `./build` directory
- Clone the repository 
```
git clone https://github.com/iamaftabshaikh/scalereal-tf.git
```


- Preprare AWS IAM role with appropriate permission to use with Terraform 

- Download Secret and Access key and store it under `./build` directory with `.secret.tfvars` file as per following,
```
access_key = "AKIxxxxxxxxxxxxxxxx"
secret_key = "otYrsTTm1X+xxxxxxxxxxxxxxxxxxxxxxxxxxx"
```
Note: It is not desirable to store credential locally in a plain text, it should be stored in a vault and should be supplied to terraform during runtime.

- Change directory to `build`
```
cd build
```

- Validate and Plan terraform 
```
terraform init
terraform validate
terraform plan --var-file=.secret.tfvars
```

- Upon secessfull terraform plan and validate, execute apply command
```
terraform apply --var-file=.secret.tfvars
```


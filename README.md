# Schedule serverless jobs using AWS Fargate

On this sample of Infrastructure as Code, we are using [Terraform](https://www.terraform.io/) to deploy infrastructure to schedule serverless jobs (bash) using [AWS Fargate](https://aws.amazon.com/fargate/?nc1=h_ls).

Blog post [here](https://zoph.me/)

## Pre-requirements
- Create Role: ecsExec Role (could be integrated in the IaC)
- Create an artifacts bucket & remote state
- Get information of your AWS Account:
    - vpc id used
    - security group id used

## Setup
- Edit variables on `Makefile` accordingly
- Edit `variables.tf`
- Edit `Dockerfile` for your needs

## Usage

### Deploy
- Run `make plan`
- Run `make deploy`

### Destroy
- Run `make destroy`

## Schema

![Schema](./assets/schema-fargate.png)

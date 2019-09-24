# Serverless jobs using AWS Fargate

On this sample of Infrastructure as Code, we are using [Terraform](https://www.terraform.io/) to deploy infrastructure to schedule serverless jobs (bash) using AWS Fargate.

Blog post [here](https://zoph.me/)

## Pre-requirements
- Create Role: ecsExec Role (could be integrated in the IaC)
- Create an artifacts bucket & remote state
- Get information of your AWS Account:
    - vpc id used
    - security group id used

## Usage
- Edit variables on `Makefile` accordingly
- Edit `variables.tf`
- Edit `Dockerfile` for your needs
- Run `make plan`
- Run `make deploy`

## Schema

![Schema](./assets/schema-fargate.png)

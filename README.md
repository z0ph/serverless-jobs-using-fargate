# Serverless jobs using AWS fargate

Schedule serverless jobs using AWS Fargate - Example

Blog post [here](https://zoph.me)

## Pre-requirements
- Create Role: ecsExec Role
- Create Artifacts bucket & remote state
- Edit variables on `Makefile` accordingly
- Edit `Dockerfile` for your needs
- Get information on your AWS Account:
    - vpc id
    - security group id

## Usage
- Edit `variables.tf`
- `make plan`
- `make deploy`


## Schema

![Schema](./assets/schema-fargate.png)

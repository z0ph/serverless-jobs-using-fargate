# Schedule serverless jobs using AWS Fargate

On this sample of Infrastructure as Code, we are using [Terraform](https://www.terraform.io/) to deploy infrastructure to schedule serverless jobs (bash) using [AWS Fargate](https://aws.amazon.com/fargate/?nc1=h_ls).

Blog post [here](https://zoph.me/posts/2019-09-22-serverless-jobs-scheduling-using-aws-fargate/)

## Pre-requirements
- Create Role: ecsExec Role (could be integrated in the IaC)
- Create an artefacts bucket & remote state
- Get information of your AWS Account:
    - `vpc id` used
    - `security group id` used

## Usage

### Deploy
- `git clone https://github.com/z0ph/serverless-jobs-using-fargate.git`
- Prepare your Docker image (using `Dockerfile`)
- Adapt the `variables.tf`, and variables in `Makefile` to your needs
- Run `make plan`
- Run `make deploy`
- Run `make build-docker`
- Take a nap, enjoy :cocktail:`

### Destroy
- Run `make destroy`

## Schema

![Schema](./assets/schema-fargate.png)

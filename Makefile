.DEFAULT_GOAL := help

help:
	@echo "${PROJECT}"
	@echo "${DESCRIPTION}"
	@echo ""
	@echo "	build-docker - Build and push docker image"
	@echo "	plan - init, validate and plan (dry-run) IaC using Terraform"
	@echo "	deploy - deploy the IaC using Terraform"
	@echo "	destroy - delete all previously created infrastructure using Terraform"
	@echo "	clean - clean the build folder"


################ Project #######################
PROJECT ?= serverless-jobs-using-fargate
DESCRIPTION ?= Schedule serverless jobs using AWS Fargate
################################################

################ Config ########################
S3_BUCKET ?= zoph-lab-terraform-tfstate
AWS_REGION ?= eu-west-1
ENV ?= dev
ECR := XXX # Example: 123456789012.dkr.ecr.eu-west-1.amazonaws.com/{project_name}-ecr-{env}
################################################

build-docker:
	@echo "run aws ecr get-login --region $(AWS_REGION) first"
	@docker build -t fargate-image .
	@docker tag fargate-image $(ECR)
	@docker push $(ECR)

################ Terraform #####################
plan:
	@terraform init \
		-backend-config="bucket=$(S3_BUCKET)" \
		-backend-config="key=$(PROJECT)/terraform.tfstate" \
		./tf-fargate/

	@terraform validate ./tf-fargate/

	terraform plan \
		-var="env=$(ENV)" \
		-var="project=$(PROJECT)" \
		-var="description=$(DESCRIPTION)" \
		-var="aws_region=$(AWS_REGION)" \
		-var="artifacts_bucket=$(S3_BUCKET)" \
		-state="$(PROJECT)-$(ENV)-$(AWS_REGION).tfstate" \
		-out="$(PROJECT)-$(ENV)-$(AWS_REGION).tfplan" \
		./tf-fargate/

deploy:
	terraform apply \
		-state="$(PROJECT)-$(ENV)-$(AWS_REGION).tfstate" \
			$(PROJECT)-$(ENV)-$(AWS_REGION).tfplan

destroy:
	@read -p "Are you sure that you want to destroy: '$(PROJECT)-$(ENV)-$(AWS_REGION)'? [yes/N]: " sure && [ $${sure:-N} = 'yes' ]
	terraform destroy ./tf-fargate/

clean:
	@rm -fr build/
	@rm -fr dist/
	@rm -fr htmlcov/
	@rm -fr site/
	@rm -fr .eggs/
	@rm -fr .tox/
	@rm -fr *.tfstate
	@rm -fr *.tfplan
	@find . -name '*.egg-info' -exec rm -fr {} +
	@find . -name '.DS_Store' -exec rm -fr {} +
	@find . -name '*.egg' -exec rm -f {} +
	@find . -name '*.pyc' -exec rm -f {} +
	@find . -name '*.pyo' -exec rm -f {} +
	@find . -name '*~' -exec rm -f {} +
	@find . -name '__pycache__' -exec rm -fr {} +

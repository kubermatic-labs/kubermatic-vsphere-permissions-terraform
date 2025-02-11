
TF_CONFIG ?= .

CLOUD_CREDENTIALS_ENV_FILE=./secrets/credentials.sh
include ${CLOUD_CREDENTIALS_ENV_FILE}
export

##### Terraform

tf-init:
	cd ${TF_CONFIG} && \
	terraform init

tf-plan: tf-init
	cd ${TF_CONFIG} && \
	terraform plan

tf-apply: tf-init
	cd ${TF_CONFIG} && \
	terraform apply

tf-destroy:
	cd ${TF_CONFIG} && \
	terraform destroy

tf-refresh:
	cd ${TF_CONFIG} && \
	terraform refresh

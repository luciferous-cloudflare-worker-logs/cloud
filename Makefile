SHELL = /usr/bin/env bash -xeuo pipefail

terraform-init:
	terraform init \
		-backend-config="bucket=$$BACKEND_S3_BUCKET" \
		-backend-config="key=$$BACKEND_S3_KEY" \
		-backend-config="region=$$BACKEND_REGION"

format: \
	fmt-terraform

fmt-terraform: \
	fmt-terraform-root \
	fmt-terraform-common

fmt-terraform-root:
	terraform fmt

fmt-terraform-common:
	cd ./terraform_modules/common; \
	terraform fmt


.PHONY: \
	format \
	fmt-terraform \
	fmt-terraform-root \
	fmt-terraform-common


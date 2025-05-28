

export CHECKPOINT_SESSION_NAME := TF $(shell date) $(shell hostname)
export CHECKPOINT_SESSION_DESCRIPTION := Terraform session description

apply:
	rm sid.json || true
	../scripts/tfinit.sh
	../scripts/validate.sh
	if terraform apply -auto-approve; then \
		echo "Terraform apply succeeded"; \
		../scripts/publish.sh; \
	else \
		echo "Terraform apply failed"; \
		../scripts/discard.sh; \
	fi


down:
	rm sid.json || true
	../scripts/tfinit.sh
	terraform destroy -auto-approve
	
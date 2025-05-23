

export CHECKPOINT_SESSION_NAME := TF $(shell date) $(shell hostname)
export CHECKPOINT_SESSION_DESCRIPTION := Terraform session description

apply:
	rm sid.json || true
	../scripts/tfinit.sh
	../scripts/validate.sh
	../scripts/apply.sh
	../scripts/publish.sh

down:
	rm sid.json || true
	../scripts/tfinit.sh
	terraform destroy -auto-approve
	
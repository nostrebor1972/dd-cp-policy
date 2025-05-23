
apply:
	../scripts/tfinit.sh
	../scripts/validate.sh
	../scripts/apply.sh
	../scripts/publish.sh

down:
	../scripts/tfinit.sh
	rm sid.json || true
	export CHECKPOINT_SESSION_NAME="Manual TF Destroy $$(date)"
	terraform destroy -auto-approve
	

apply:
	../scripts/tfinit.sh
	terraform validate
	terraform apply -auto-approve
	../scripts/publish.sh

down:
	../scripts/tfinit-with-state.sh
	terraform destroy -auto-approve
	
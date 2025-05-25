
apply:
	cd ./inventory && make apply
	cd ./apps && make apply
destroy:
	cd ./apps && make destroy
	cd ./inventory && make destroy
	

apply:
	cd ./inventory && make apply
	cd ./apps && make apply
down:
	cd ./apps && make down
	cd ./apps && ../scripts/publish.sh
	cd ./inventory && make down
	cd ./inventory && ../scripts/publish.sh
	
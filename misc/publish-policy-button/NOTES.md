# Deno Deploy app to publish data-driven CHKP policy by Github Actions

```shell
# install deno
curl -fsSL https://deno.land/x/install/install.sh | sh

# test app 
cd ./misc/publish-policy-button/
deno run --allow-net --allow-read --allow-env --allow-write ./main.ts


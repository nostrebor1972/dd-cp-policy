```shell

# new instance operated by app
pushd $(mktemp -d)
gh repo clone mkol5222/dd-cp-policy
cd dd-cp-policy

code ./inventory/data/hosts.yaml
code ./apps/data/apps.yaml

git status
git add inventory/data/hosts.yaml apps/data/apps.yaml
git status
git commit -m "Skupa updates hosts and apps data"
git push origin main
popd

git pull
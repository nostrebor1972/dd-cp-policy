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

### scenario 2: commit and PR by GH API

pushd $(mktemp -d)
gh repo clone mkol5222/dd-cp-policy
cd dd-cp-policy

code ./inventory/data/hosts.yaml
code ./apps/data/apps.yaml
git status



# Get the file content and encode it in base64
content=$(base64 -w 0 ./inventory/data/hosts.yaml)

# Get the current file SHA (if the file exists)
sha=$(curl -s \
    -H "Authorization: token ${REPORW_GITHUB_TOKEN}" \
    https://api.github.com/repos/mkol5222/dd-cp-policy/contents/inventory/data/hosts.yaml \
    | jq -r .sha)

# Commit the file using GitHub API
curl -X PUT \
    -H "Authorization: token ${REPORW_GITHUB_TOKEN}" \
    -H "Content-Type: application/json" \
    -d "{
        \"message\": \"Update hosts.yaml via API\",
        \"content\": \"${content}\",
        \"branch\": \"main\",
        \"sha\": \"${sha}\"
    }" \
    https://api.github.com/repos/mkol5222/dd-cp-policy/contents/inventory/data/hosts.yaml

# now file is commited to main and GHA shoudl be triggered
git status
popd 
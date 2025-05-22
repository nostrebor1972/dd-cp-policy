```shell
# set up the environment of Github Actions - similar to
echo "mtest1-6eno66u6.maas.checkpoint.com" | gh secret set CHECKPOINT_SERVER --repo mkol5222/dd-cp-policy
echo "1fc4d33c-9a86-487c-8eab-8ea8cff15f42" | gh secret set CHECKPOINT_CLOUD_MGMT_ID  --repo mkol5222/dd-cp-policy
echo "xxx==" | gh secret set CHECKPOINT_API_KEY  --repo mkol5222/dd-cp-policy

# TF backend
STORAGE_ACCOUNT_NAME="tfstate6aa470f2"
BLOB_CONTAINER_NAME="tfstate"
RESOURCE_GROUP_NAME="tfstate-6aa470f2"
ACCOUNT_KEY="xxx="
STATE_FILE=gha_inventory.tfstate

echo $STORAGE_ACCOUNT_NAME | gh secret set STORAGE_ACCOUNT_NAME --repo mkol5222/dd-cp-policy
echo $BLOB_CONTAINER_NAME | gh secret set BLOB_CONTAINER_NAME --repo mkol5222/dd-cp-policy
echo $RESOURCE_GROUP_NAME | gh secret set RESOURCE_GROUP_NAME --repo mkol5222/dd-cp-policy
echo $ACCOUNT_KEY | gh secret set ACCOUNT_KEY --repo mkol5222/dd-cp-policy
echo $STATE_FILE | gh secret set STATE_FILE --repo mkol5222/dd-cp-policy

# to later use as
echo terraform init -backend-config="storage_account_name=$STORAGE_ACCOUNT_NAME" \
  -backend-config="container_name=$BLOB_CONTAINER_NAME" \
  -backend-config="key=$STATE_FILE" \
  -backend-config="access_key=$ACCOUNT_KEY" 
```
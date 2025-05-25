```shell
# first load variables and pipeline secrets from secrets ...

# list of expected variables for CP management and TF backend


echo $CHECKPOINT_SERVER | gh secret set CHECKPOINT_SERVER --repo mkol5222/dd-cp-policy
echo $CHECKPOINT_CLOUD_MGMT_ID   | gh secret set CHECKPOINT_CLOUD_MGMT_ID  --repo mkol5222/dd-cp-policy
echo $CHECKPOINT_API_KEY | gh secret set CHECKPOINT_API_KEY  --repo mkol5222/dd-cp-policy


echo $STORAGE_ACCOUNT_NAME | gh secret set STORAGE_ACCOUNT_NAME --repo mkol5222/dd-cp-policy
echo $BLOB_CONTAINER_NAME | gh secret set BLOB_CONTAINER_NAME --repo mkol5222/dd-cp-policy
echo $RESOURCE_GROUP_NAME | gh secret set RESOURCE_GROUP_NAME --repo mkol5222/dd-cp-policy
echo $ACCOUNT_KEY | gh secret set ACCOUNT_KEY --repo mkol5222/dd-cp-policy
echo $STATE_FILE | gh secret set STATE_FILE --repo mkol5222/dd-cp-policy


```

Inventory UI

https://docs.google.com/spreadsheets/d/1AxnotD9U9kKOluFNRFPQoddXRg4ffVHaamdDIj31UhM/edit?gid=0#gid=0

GSheet JSON
```shell
curl -s https://opensheet.elk.sh/1AxnotD9U9kKOluFNRFPQoddXRg4ffVHaamdDIj31UhM/feed | jq .

curl -s https://opensheet.elk.sh/1AxnotD9U9kKOluFNRFPQoddXRg4ffVHaamdDIj31UhM/feed | jq -r '.[].ip'
````
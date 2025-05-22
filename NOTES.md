```shell
# set up the environment of Github Actions - similar to
echo "mtest1-6eno66u6.maas.checkpoint.com" | gh secret set CHECKPOINT_SERVER --repo mkol5222/dd-cp-policy
echo "1fc4d33c-9a86-487c-8eab-8ea8cff15f42" | gh secret set CHECKPOINT_CLOUD_MGMT_ID  --repo mkol5222/dd-cp-policy
echo "xxx==" | gh secret set CHECKPOINT_API_KEY  --repo mkol5222/dd-cp-policy

```
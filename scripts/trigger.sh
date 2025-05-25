#!/bin/bash

#!/bin/bash

# stop if no GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN is not set. Please set it before running this script."
  exit 1
fi

# ==== CONFIGURATION ====
#GITHUB_TOKEN="ghp_your_personal_access_token_here"

OWNER="mkol5222"
REPO="dd-cp-policy"
WORKFLOW_FILE="apply.yml"  # Or you can use the workflow ID
REF="main"  # Branch or tag name
INPUTS='{}'  # Optional workflow inputs, or leave empty '{}'

# ==== API CALL ====
curl -s -X POST \
  -H "Authorization: Bearer $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github+json" \
  https://api.github.com/repos/$OWNER/$REPO/actions/workflows/$WORKFLOW_FILE/dispatches \
  -d "$(jq -n --arg ref "$REF" --argjson inputs "$INPUTS" '{ref: $ref, inputs: $inputs}')" \
  | jq .

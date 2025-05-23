#!/bin/bash

rm sid.json || true
export CHECKPOINT_SESSION_NAME="Manual TF $(date)" 
terraform validate

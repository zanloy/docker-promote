#!/bin/bash

export FROM_HOST="container-registry.stage8.bip.va.gov"
export FROM_IMAGE="bip-pension-automation/bip-classifier"
export FROM_TAG="uat-1.0.4-RC1"
export FROM_USERNAME="StageUser"
export FROM_PASSWORD="StagePassword"

export TO_HOST="container-registry.prod8.bip.va.gov"
export TO_IMAGE="bip-pension-automation/bip-classifier"
export TO_TAG="prodtest-1.0.4-RC1"
export TO_USERNAME="SecretUser"
export TO_PASSWORD="SecretPassword"

./promote.sh

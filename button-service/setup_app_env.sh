#!/bin/bash

echo "did you set AWS_PROFILE?  Do you need to?"


set -x

cd "$(dirname ${BASH_SOURCE[0]})"

cat > ../app/.env << MARKER
REACT_APP_IdentityPoolId=$(aws cognito-identity list-identity-pools --max-results 10 | jq -r '.IdentityPools[] | select(.IdentityPoolName == "Serialexa") | .IdentityPoolId')
REACT_APP_Region=us-east-1
REACT_APP_IOT_ENDPOINT=$(aws iot describe-endpoint | jq -r .endpointAddress)
REACT_APP_THING_NAME=SeriAlexa-0001
MARKER


#!/bin/sh

export GITHUB_TOKEN=$(cat /run/secrets/github_token)

git config --global url."https://x-access-token:$GITHUB_TOKEN@github.com/".insteadOf "https://github.com/"

if [ -z "$(ls -A /go/src/app)" ]; then
   echo "Cloning repositories into /go/src/app..."
   git clone https://github.com/autheo-network/go-sdk.git /go/src/app/go-sdk
   git clone https://github.com/autheo-network/go-sdk-examples.git /go/src/app/go-sdk-examples
else
   echo "Directory is not empty, skipping clone."
fi

exec "$@"

#!/bin/sh

export GITHUB_TOKEN=$(cat /run/secrets/github_token 2>/dev/null)

if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: github_token file is empty or not found!"
    exit 1
fi

git config --global url."https://x-access-token:$GITHUB_TOKEN@github.com/".insteadOf "https://github.com/"

if [ -z "$(ls -A root/go/src/app)" ]; then
   echo "Cloning repositories into /go/src/app..."
   git clone https://github.com/autheo-network/go-sdk.git root/go/src/app/go-sdk
   git clone https://github.com/autheo-network/go-sdk-examples.git root/go/src/app/go-sdk-examples
else
   echo "Directory is not empty, skipping clone."
fi

exec "$@"

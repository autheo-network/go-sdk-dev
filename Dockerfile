# syntax=docker/dockerfile:1

# Use Go 1.23.6 (Debian 12) image
FROM golang:1.23.6-bookworm

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl wget unzip git && \
    rm -rf /var/lib/apt/lists/*

# Install solc 0.8.20
ENV SOLC_VERSION=0.8.20
RUN curl -fsSL -o solc-amd64 "https://github.com/ethereum/solidity/releases/download/v${SOLC_VERSION}/solc-static-linux" && \
    chmod +x solc-amd64 && \
    mv solc-amd64 /usr/local/bin/solc

# Install go-sdk and go-sdk-examples
RUN --mount=type=secret,id=github_token \
    export GITHUB_TOKEN=$(cat /run/secrets/github_token) && \
    git clone https://$GITHUB_TOKEN@github.com/autheo-network/go-sdk.git ./go-sdk && \
    git clone https://$GITHUB_TOKEN@github.com/autheo-network/go-sdk-examples.git ./go-sdk-examples && \
    git config --global url."https://x-access-token:$GITHUB_TOKEN@github.com/".insteadOf "https://github.com/"

# Working directory
WORKDIR /go/src/app

# Default command
CMD ["sh"]

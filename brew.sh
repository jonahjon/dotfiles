#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install kubectl
brew install aws-iam-authenticator
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"\nsudo installer -pkg AWSCLIV2.pkg -target /
aws sts get-caller-identity
brew install bazel
brew install bash-completion
brew install curl
brew install dep
brew install docker-compose
brew install eksctl
brew install git
brew install gnupg
brew install helm
brew install hugo
brew install jq
brew install jsonnet
brew install helm
brew install kind
brew install kubectx
brew install kustomize
brew install poetry
brew install pipenv
brew install stern
brew install terraform
brew install tilt
brew install wget

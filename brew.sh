#!/usr/bin/env bash

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install kubectl
brew install aws-iam-authenticator
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"\nsudo installer -pkg AWSCLIV2.pkg -target /
aws sts get-caller-identity
brew install aws-iam-authenticator
brew install bazel
brew install bash-completion
brew install curl
brew install crane
brew install dep
brew install docker-compose
brew install eksctl
brew install git
brew install gnupg
brew install gpg
brew install helm
brew install oras
brew install hugo
brew install jq
brew install yq
brew install helm
brew install kind
brew install kubectx
brew install kustomize
brew install poetry
brew install terraform
brew install wget

https://docs.gitlab.com/ee/user/project/repository/gpg_signed_commits/
gpg --gen-key
gpg --list-secret-keys
git config --global commit.gpgsign true



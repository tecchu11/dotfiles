#!/bin/bash

kubectl completion zsh > $(brew --prefix)/share/zsh/site-functions/_kubectl
npm completion zsh > $(brew --prefix)/share/zsh/site-functions/_npm
kind completion zsh > $(brew --prefix)/share/zsh/site-functions/_kind
kustomize completion zsh > $(brew --prefix)/share/zsh/site-functions/_kustomize

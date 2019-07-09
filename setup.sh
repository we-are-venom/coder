#!/bin/bash
set -e

# Install go tools dependencies
go get -v github.com/mdempsky/gocode 
go get -v github.com/uudashr/gopkgs/cmd/gopkgs 
go get -v github.com/ramya-rao-a/go-outline 
go get -v github.com/acroca/go-symbols 
go get -v golang.org/x/tools/cmd/guru 
go get -v golang.org/x/tools/cmd/gorename 
go get -v github.com/go-delve/delve/cmd/dlv 
go get -v github.com/stamblerre/gocode 
go get -v github.com/rogpeppe/godef 
go get -v github.com/sqs/goreturns 
go get -v golang.org/x/lint/golint 
go get -v golang.org/x/tools/cmd/goimports
go get -v github.com/sourcegraph/go-langserver

# Install coder plugins
code-server --install-extension ms-vscode.go 
code-server --install-extension peterjausovec.vscode-docker 

# Configure git


git config --global user.name "We Are Venom"
git config --global user.email "52611123+we-are-venom@users.noreply.github.com"
git config --global alias.co checkout
git config --global push.default current

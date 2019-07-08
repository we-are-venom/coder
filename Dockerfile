FROM codercom/code-server

USER root 

RUN cd /tmp \
  && wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz \
  && tar -xvf go1.12.6.linux-amd64.tar.gz \
  && mv go /usr/local \
  && cd -

USER coder

ENV GOROOT=/usr/local/go

ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH

RUN go get github.com/mdempsky/gocode \
  && go get github.com/uudashr/gopkgs/cmd/gopkgs \
  && go get github.com/ramya-rao-a/go-outline \
  && go get github.com/acroca/go-symbols \
  && go get golang.org/x/tools/cmd/guru \
  && go get golang.org/x/tools/cmd/gorename \
  && go get github.com/go-delve/delve/cmd/dlv \
  && go get github.com/stamblerre/gocode \
  && go get github.com/rogpeppe/godef \
  && go get github.com/sqs/goreturns \
  && go get golang.org/x/lint/golint 

RUN code-server --install-extension ms-vscode.go \
  && code-server --install-extension peterjausovec.vscode-docker \
  && echo "{
    "files.autoSave": "afterDelay",
    "editor.renderWhitespace": "all",
    "go.autocompleteUnimportedPackages": true,
    "go.coverOnSave": true,
    "go.formatTool": "goimports",
    "go.gocodeAutoBuild": true,
    "go.useLanguageServer": true
}" > /home/coder/.local/share/code-server/User/settings.json

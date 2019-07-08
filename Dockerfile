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

RUN code-server --install-extension ms-vscode.go && code-server --install-extension ms-azuretools.vscode-docker

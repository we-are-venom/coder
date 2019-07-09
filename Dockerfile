FROM codercom/code-server

USER root 

RUN cd /tmp \
  && wget https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz \
  && tar -xvf go1.12.6.linux-amd64.tar.gz \
  && mv go /usr/local \
  && rm -f /tmp/go1.12.6.linux-amd64.tar.gz \
  && cd -

USER coder

ENV GOROOT=/usr/local/go
ENV GOPATH=/home/coder/go
ENV PATH=$GOPATH/bin:$GOROOT/bin:$PATH


COPY --chown=coder:coder settings.json /home/coder/.local/share/code-server/User/
COPY --chown=coder:coder setup.sh /tmp

RUN chmod +x /tmp/setup.sh && /tmp/setup.sh && rm -f /tmp/setup.sh

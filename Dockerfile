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


COPY settings.json /home/coder/.local/share/code-server/User/
COPY setup.sh .

RUN chmod +x setup.sh && ./setup.sh && rm -f setup.sh

FROM ubuntu:latest

# download go
RUN wget https://go.dev/dl/go1.17.8.linux-amd64.tar.gz

# untar
RUN tar -zxvf go1.17.8.linux-amd64.tar.gz -C /usr/local

# set env
RUN echo "export GOPATH=/usr/local/gopath" >> /etc/profile
RUN echo "export GOROOT=/usr/local/go" >> /etc/profile
RUN echo "PATH=$GOROOT/bin:$PATH" >> /etc/profile

# git config
RUN git config --global http.sslBackend gnutls
# disable git ssl
ENV GIT_SSL_NO_VERIFY true

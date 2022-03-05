FROM ubuntu:latest

# update
RUN apt update
# download wget
RUN apt -y install wget
# other tools
RUN apt -y install curl
RUN apt -y install git

# git config
RUN git config --global http.sslBackend gnutls
# disable git ssl
ENV GIT_SSL_NO_VERIFY true

# download go
RUN wget https://go.dev/dl/go1.17.8.linux-amd64.tar.gz

# untar
RUN tar -zxvf go1.17.8.linux-amd64.tar.gz -C /usr/local

# set go env
ENV GOPATH /usr/local/go
ENV PATH $GOPATH/bin:$PATH
RUN chmod -R 777 "$GOPATH"

WORKDIR /home
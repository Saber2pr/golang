FROM ubuntu:latest

# update
RUN apt update
# download wget
RUN apt -y install wget
# other tools
RUN apt -y install curl
RUN apt -y install git

# download go
RUN wget https://go.dev/dl/go1.17.8.linux-amd64.tar.gz

# untar
RUN tar -zxvf go1.17.8.linux-amd64.tar.gz -C /usr/local

# set env
RUN echo "export GOPATH=/usr/local/gopath" >> /etc/profile
RUN echo "export GOROOT=/usr/local/go" >> /etc/profile
RUN echo "export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/local/go/bin" >> /etc/profile

# git config
RUN git config --global http.sslBackend gnutls
# disable git ssl
ENV GIT_SSL_NO_VERIFY true

FROM centos:7
RUN yum update -y
RUN yum install -y gcc pam-devel wget git sudo
RUN wget https://golang.org/dl/go1.15.6.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz
COPY compile.sh /
CMD /compile.sh

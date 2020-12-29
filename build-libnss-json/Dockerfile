FROM centos:7
RUN yum update -y
RUN yum install -y gcc pam-devel wget git sudo make libcurl-devel
COPY compile.sh /
CMD /compile.sh

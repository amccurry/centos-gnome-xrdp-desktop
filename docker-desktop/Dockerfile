FROM desktop
RUN yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo && \
    yum update -y && \
    yum install -y docker-ce docker-ce-cli containerd.io && \
    systemctl enable docker

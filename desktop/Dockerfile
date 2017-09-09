FROM systemd
RUN yum -y groupinstall "GNOME Desktop"
RUN yum -y install epel-release && yum -y install xrdp tigervnc-server && yum -y update
RUN systemctl enable xrdp.service
RUN useradd red && echo red | passwd red --stdin
RUN yum -y update
CMD ["/usr/sbin/init"]

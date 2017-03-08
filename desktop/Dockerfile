FROM systemd
RUN yum -y groupinstall "GNOME Desktop"
COPY xrdp.repo /etc/yum.repos.d/xrdp.repo
RUN yum -y install xrdp tigervnc-server
RUN systemctl enable xrdp.service
RUN useradd red && echo red | passwd red --stdin
RUN yum -y update
RUN gsettings set org.gnome.settings-daemon.plugins.cursor active false
CMD ["/usr/sbin/init"]

FROM systemd
RUN yum -y groupinstall "GNOME Desktop"
RUN yum -y update
COPY opt/desktop/ /opt/desktop/
RUN /opt/desktop/bin/install.sh
CMD ["/opt/desktop/sbin/entrypoint.sh"]

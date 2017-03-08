## Centos GNOME xrdp Desktop

How to build:
```
docker build -t systemd base/
docker build -t desktop desktop/
```

How to run:
```
docker run -d -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --cap-add=SYS_ADMIN -p 3389:3389 --name desktop desktop
```

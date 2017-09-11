## Centos GNOME xrdp Desktop

How to build:
```
docker build -t systemd base/
docker build -t desktop desktop/
docker build -t volume-desktop vdesktop/
```

How to run ephemeral desktop:
```
docker run -d \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --cap-add=SYS_ADMIN \
  -p 3389:3389 \
  --stop-signal SIGRTMIN+3 \
  --name desktop \
  desktop
```

How to run persistent desktop:
```
export VOLUME_ROOT_NAME=runtime_vdesktop
export VOLUME_ROOT=/runtime_root

docker run -d  \
  -e VOLUME_ROOT=${VOLUME_ROOT} \
  -v ${VOLUME_ROOT_NAME}:${VOLUME_ROOT} \
  -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
  --cap-add=SYS_ADMIN \
  -p 3389:3389 \
  --stop-signal SIGRTMIN+3 \
  --name desktop \
  vdesktop
```

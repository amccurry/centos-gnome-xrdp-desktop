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

How to run docker (20.10.1) desktop:

The custom seccomp contains two additional syscalls needed for docker (20.10.1) to function.
 - keyctl
 - pivot_root


```
docker run -d --rm \
  --security-opt seccomp=${PWD}/docker-desktop/seccomp.json \
  --shm-size=1g \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_ADMIN \
  -p 9223:3389 \
  --stop-signal SIGRTMIN+3 \
  --name desktop \
  docker-desktop
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

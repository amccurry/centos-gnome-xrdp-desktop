# Centos 7 GNOME Desktop

The centos 7 GNOME Desktop image contains xrdp for remote access and docker in docker.

## Login

User: ```user```
Password: ```password```

## How to build
```
docker build -t local/systemd systemd/
docker build -t local/desktop desktop/
```

### Docker in Docker

How to run docker (20.10.1) in the docker desktop:
```
...
--security-opt seccomp=${PWD}/desktop/seccomp.json \
-v /sys/fs/cgroup:/sys/fs/cgroup \
--cap-add=NET_ADMIN \
--cap-add=SYS_ADMIN \
...
```

The custom seccomp contains two additional syscalls needed for docker (20.10.1) to function.
 - keyctl
 - pivot_root

## How to run

### Stateless

This desktop will reset on every startup, normal docker behavior.

```
docker run -d --rm \
  --device /dev/fuse \
  --security-opt seccomp=${PWD}/desktop/seccomp.json \
  --shm-size=1g \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_ADMIN \
  -p 3389:3389 \
  --stop-signal SIGRTMIN+3 \
  --name desktop \
  desktop
```

### Stateful

This desktop will behavior like a normal desktop and retain changes between restart.

```
export VOLUME_ROOT_NAME=runtime_vdesktop
export VOLUME_ROOT=/runtime_root

docker run -d --rm \
  -e VOLUME_ROOT=${VOLUME_ROOT} \
  -v ${VOLUME_ROOT_NAME}:${VOLUME_ROOT} \
  --device /dev/fuse \
  --security-opt seccomp=${PWD}/desktop/seccomp.json \
  --shm-size=1g \
  -v /sys/fs/cgroup:/sys/fs/cgroup \
  --cap-add=NET_ADMIN \
  --cap-add=SYS_ADMIN \
  -p 3389:3389 \
  --stop-signal SIGRTMIN+3 \
  --name desktop \
  desktop
```

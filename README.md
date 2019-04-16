# Basilisk II in Docker

Basilisk II nicely wrapped up in docker. This uses an ARM base image.

# Pulling

```bash
$ docker pull benletchford/docker-basiliskii-armhf
```

# Example Usage

```bash
$ docker run \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.Xauthority:/home/macpi/.Xauthority \
  -v $HOME/.basilisk_ii_prefs:/home/macpi/.basilisk_ii_prefs \
  --device /dev/snd \
  --group-add $(getent group audio | cut -d: -f3) \ # Add container to host's audio group so it can use /dev/snd
  --net=host \
  benletchford/docker-basiliskii-armhf
```

# Building
```bash
$ docker build -t docker-basiliskii-armhf .
```

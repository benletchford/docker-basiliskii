# Basilisk II in Docker

Basilisk II nicely wrapped up in docker.

There's `Dockerfile` for x86 and `Dockerfile.armhf` for ARM (eg, RaspberryPi's).

## Pulling

### x86
```bash
$ docker pull benletchford/docker-basiliskii
```

### ARM
```bash
$ docker pull benletchford/docker-basiliskii-armhf
```

## Example Usage

```bash
$ docker run \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -v $HOME/.Xauthority:/home/basiliskii/.Xauthority \
  -v $HOME/.basilisk_ii_prefs:/home/basiliskii/.basilisk_ii_prefs \
  --device /dev/snd \
  --group-add $(getent group audio | cut -d: -f3) \ # Add container to host's audio group so it can use /dev/snd
  --net=host \
  benletchford/docker-basiliskii
```

*Use benletchford/docker-basiliskii-armhf if using ARM*

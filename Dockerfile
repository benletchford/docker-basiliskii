FROM ubuntu:xenial

RUN apt-get -y update
RUN apt-get install -y git libsdl1.2-dev autoconf libgtk2.0-dev libxxf86dga-dev libxxf86vm-dev libesd0-dev xserver-xorg-core xserver-xorg-input-all xserver-xorg-video-fbdev

RUN git clone https://github.com/cebix/macemu /opt/macemu
WORKDIR /opt/macemu/BasiliskII/src/Unix
RUN ./autogen.sh --enable-sdl-video --enable-sdl-audio --disable-vosf --disable-jit-compiler && make && make install

RUN groupadd -r basiliskii -g 1000
RUN useradd -r -u 1000 -g basiliskii basiliskii

USER basiliskii

ENTRYPOINT ["/usr/local/bin/BasiliskII"]

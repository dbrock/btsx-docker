FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install git cmake g++ libz-dev libboost-all-dev \
  libssl-dev libreadline-dev libdb++-dev
RUN git clone https://github.com/dacsunlimited/bitsharesx src
WORKDIR src
RUN git checkout v0.4.18
RUN git submodule update --init
RUN cmake .
RUN make -j`grep ^processor /proc/cpuinfo | wc -l`
RUN install programs/client/bitshares_client /usr/local/bin
ENTRYPOINT ["bitshares_client"]

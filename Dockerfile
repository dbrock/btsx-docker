FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get -y install \
  git cmake g++ libz-dev libboost-all-dev \
  libssl-dev libreadline-dev libdb++-dev
ENTRYPOINT ["btsx"]
RUN git clone https://github.com/dacsunlimited/bitsharesx && \
  (cd bitsharesx && git checkout master && \
   git submodule update --init && cmake . && make -j && \
   install programs/client/bitshares_client /usr/local/bin/btsx) && \
  rm -r bitsharesx

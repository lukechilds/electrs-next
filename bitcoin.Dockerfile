FROM debian:buster-slim

WORKDIR /build

RUN apt-get update

# Buildtime dependencies
RUN apt-get install -y build-essential libtool autotools-dev automake pkg-config bsdmainutils python3

# Runtime dependencies
RUN apt-get install -y libevent-dev libboost-system-dev libboost-filesystem-dev libboost-test-dev libboost-thread-dev

# Clone source
RUN apt-get install -y git
RUN git clone --branch locations https://github.com/romanz/bitcoin.git .

# Build
RUN ./autogen.sh
RUN ./configure --disable-wallet --without-gui --without-miniupnpc
RUN make -j"$(($(nproc)+1))"

ENTRYPOINT ["/build/src/bitcoind"]

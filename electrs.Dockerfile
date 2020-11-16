FROM debian:buster-slim

WORKDIR /build

RUN apt-get update

# Buildtime dependencies
RUN apt-get install -y cargo clang cmake libsnappy-dev

# Clone source
RUN apt-get install -y git
RUN git clone --branch next https://github.com/romanz/electrs .

# Build
RUN cargo build --release

STOPSIGNAL SIGINT

ENTRYPOINT ["/build/target/release/electrs_query"]

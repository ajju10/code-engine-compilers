FROM ubuntu:22.04

RUN apt-get update && apt-get install -y \
    pkg-config \
    gcc \
    g++ \
    git \
    make \
    libsystemd-dev \
    libcap-dev \
    ca-certificates \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ajju10/isolate.git /tmp/isolate && \
    cd /tmp/isolate && \
    make -j$(nproc)  install && \
    rm -rf /tmp/*

ENV BOX_ROOT=/var/local/lib/isolate
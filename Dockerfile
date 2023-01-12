FROM ghcr.io/h3poteto/elixir:1.13.4-slim-buster

USER root
ENV RUST_VERSION 1.65.0

WORKDIR /tmp/

RUN set -ex && \
    curl -O https://static.rust-lang.org/dist/rust-${RUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz && \
    tar -xvf rust-${RUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz && \
    rust-${RUST_VERSION}-x86_64-unknown-linux-gnu/install.sh && \
    rm -rf rust-${RUST_VERSION}-x86_64-unknown-linux-gnu && \
    rm rust-${RUST_VERSION}-x86_64-unknown-linux-gnu.tar.gz

RUN set -ex && \
    apt-get update && \
    apt-get install -y gnupg2 && \
    curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*

USER elixir

FROM ubuntu:26.04@sha256:da6fc2be547864451aa253836dd926da33623312df4a9a243e35dc877c378a78

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install --yes --no-install-recommends \
        build-essential \
        ca-certificates \
        cmake \
        debhelper \
        devscripts \
        dh-exec \
        git \
        lintian \
        ninja-build \
        pkg-config \
    && rm -rf /var/lib/apt/lists/*

COPY packages/*.deb /tmp/

RUN apt-get update \
    && apt-get install --yes --no-install-recommends /tmp/*.deb \
    && rm -f /tmp/*.deb \
    && rm -rf /var/lib/apt/lists/*

RUN printf '%s\n' 'PS1='"'"'\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]\$ '"'"'' >> /root/.bashrc

WORKDIR /workspace

CMD ["/bin/bash"]

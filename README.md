# CamX build container

Ubuntu 26.04 ARM64 build environment for Kodiak CamX userspace packages. The
base image is pinned by digest. The image installs CamX/CHI packages and a matched
Abseil 20260107.0 and Protobuf 33.6 SDK from `packages/*.deb`.

## Build

Build on a native ARM64 Docker host:

```sh
docker build --tag camx-build-container:ubuntu26-protobuf33.6 .
```

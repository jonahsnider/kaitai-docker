# Kaitai Struct Compiler Docker Images

Docker images for the [Kaitai Struct](https://kaitai.io) compiler.

Published to Docker Hub as [`jonahsnider/kaitai-struct`](https://hub.docker.com/r/jonahsnider/kaitai-struct-compiler).

## Supported versions

| Kaitai Struct Compiler version | Docker tag                       | Dockerfile                             |
| ------------------------------ | -------------------------------- | -------------------------------------- |
| v0.10                          | `jonahsnider/kaitai-struct:0.10` | [`0.10.Dockerfile`](./0.10.Dockerfile) |
| v0.9                           | `jonahsnider/kaitai-struct:0.9`  | [`0.9.Dockerfile`](.`0.9.Dockerfile)   |
| v0.8                           | `jonahsnider/kaitai-struct:0.8`  | [`0.8.Dockerfile`](.`0.8.Dockerfile)   |
| v0.7                           | `jonahsnider/kaitai-struct:0.7`  | [`0.7.Dockerfile`](.`0.7.Dockerfile)   |
| v0.6                           | `jonahsnider/kaitai-struct:0.6`  | [`0.6.Dockerfile`](.`0.6.Dockerfile)   |
| v0.5                           | `jonahsnider/kaitai-struct:0.5`  | [`0.5.Dockerfile`](.`0.5.Dockerfile)   |
| v0.4                           | `jonahsnider/kaitai-struct:0.4`  | [`0.4.Dockerfile`](.`0.4.Dockerfile)   |
| v0.3                           | `jonahsnider/kaitai-struct:0.3`  | [`0.3.Dockerfile`](.`0.3.Dockerfile)   |
| v0.2                           | `jonahsnider/kaitai-struct:0.2`  | [`0.2.Dockerfile`](.`0.2.Dockerfile)   |

## Usage notes

Each image is using the latest Alpine version of the JRE 21 images managed by Eclipse Temurin.
If that doesn't work for you, open an issue and it shouldn't be too hard to adjust the build pipeline.

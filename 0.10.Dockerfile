FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.10/kaitai-struct-compiler-0.10.zip

RUN echo "3d11d6cc46d058afb4680fda2e7195f645ca03b2843501d652a529646e55d16b  ./kaitai-struct-compiler-0.10.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.10.zip

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.10 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

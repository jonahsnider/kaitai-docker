FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.3/kaitai-struct-compiler-0.3.zip

RUN echo "4fff97cd75ca662b59561675316ba9aa73285908efd6153af09d02a72d657dd3  ./kaitai-struct-compiler-0.3.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.3.zip

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.3 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

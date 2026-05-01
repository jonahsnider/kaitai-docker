FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.11/kaitai-struct-compiler-0.11.zip

RUN echo "ff89389d9dc9e770d78a24af328763cb1f8e7b31ce7766c9edf10669a060f2a2  ./kaitai-struct-compiler-0.11.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.11.zip

RUN rm -r ./kaitai-struct-compiler-0.11/formats

FROM eclipse-temurin:25.0.3_9-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.11 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

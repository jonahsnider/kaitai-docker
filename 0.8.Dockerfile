FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.8/kaitai-struct-compiler-0.8.zip

RUN echo "545fc10e134db2901cad8817be1b440fca6f2bad8b92b2948ebe0647f3ffa2c9  ./kaitai-struct-compiler-0.8.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.8.zip

RUN rm -r ./kaitai-struct-compiler-0.8/formats

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.8 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

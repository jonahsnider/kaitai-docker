FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.5/kaitai-struct-compiler-0.5.zip

RUN echo "94224b1ce33c6a2017d07ec41ff577144f1cacf46c48a9e1d61383da18ff150b  ./kaitai-struct-compiler-0.5.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.5.zip

RUN rm -r ./kaitai-struct-compiler-0.5/formats

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.5 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

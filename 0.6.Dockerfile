FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.6/kaitai-struct-compiler-0.6.zip

RUN echo "6f4fb84e6d09928e47f1e19c4b4d48d2cc2695db1a8482d3047845ebbaa6113f  ./kaitai-struct-compiler-0.6.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.6.zip

RUN rm -r ./kaitai-struct-compiler-0.6/formats

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.6 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

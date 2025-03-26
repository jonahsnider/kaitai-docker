FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.7/kaitai-struct-compiler-0.7.zip

RUN echo "2fdd2646ea019bbf55be5bc27f24b037a7152514dbafbb7cfcdaf27a1d190045  ./kaitai-struct-compiler-0.7.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.7.zip

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.7 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

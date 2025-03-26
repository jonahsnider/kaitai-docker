FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.4/kaitai-struct-compiler-0.4.zip

RUN echo "289149346a725239ebb8906b74650fa754818e325d078b78cbeb9ec09d82c304  ./kaitai-struct-compiler-0.4.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.4.zip

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.4 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

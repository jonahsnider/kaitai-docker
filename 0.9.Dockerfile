FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.9/kaitai-struct-compiler-0.9.zip

RUN echo "3038243334fb65bbb264f33b82986facfe1fbad2de1978766899855b40212215  ./kaitai-struct-compiler-0.9.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.9.zip

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.9 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

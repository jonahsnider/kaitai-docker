FROM alpine AS builder

WORKDIR /usr/local

RUN apk add --no-cache wget unzip perl-utils

RUN wget https://github.com/kaitai-io/kaitai_struct_compiler/releases/download/0.2/kaitai-struct-compiler-0.2.zip

RUN echo "7695ea661f4897d370354a532270410567edd9aa1c11c54a217387e7bc713078  ./kaitai-struct-compiler-0.2.zip" | shasum --algorithm 256 --check --strict

RUN unzip ./kaitai-struct-compiler-0.2.zip

FROM eclipse-temurin:21-jre-alpine

COPY --from=builder /usr/local/kaitai-struct-compiler-0.2 /usr/local/kaitai-struct-compiler

RUN apk add --no-cache bash

ENTRYPOINT ["/usr/local/kaitai-struct-compiler/bin/kaitai-struct-compiler"]

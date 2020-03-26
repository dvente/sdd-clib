FROM python:3.7-alpine

RUN apk add --no-cache gcc libc-dev make scons libexecinfo-dev 

COPY sdd-2.0 /src/sdd-2.0

COPY libsdd-2.0 /src/libsdd-2.0

WORKDIR /src

RUN cd libsdd-2.0 && scons && cp build/libsdd.a ../sdd-2.0/lib/Linux/ && cd ../sdd-2.0 && make

CMD "/bin/sh"


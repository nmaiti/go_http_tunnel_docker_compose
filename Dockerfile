FROM --platform=linux/amd64 golang:1.15.6-alpine3.12 AS go-builder
LABEL maintainer="Nabendu Maiti <nbmaiti83@gmail.com>"

ARG TARGETPLATFORM
ARG BUILDPLATFORM
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT

# Install build dependencies for docker-gen
RUN apk --no-cache add \
        curl \
        gcc \
        git \
        make \
        musl-dev ca-certificates 

# Build docker-gen

RUN cd /go/src  
RUN ls -ltr
RUN git clone https://github.com/nmaiti/go-http-tunnel.git
RUN cd go-http-tunnel 
WORKDIR  /go/go-http-tunnel 
RUN case "$TARGETVARIANT" in  \
            v7) export GOARM='6' ;; \
            v6) export GOARM='5' ;; \
			*) echo "nothing here" ;;\
    esac

RUN GOOS=$TARGETOS GOARCH=$TARGETARCH go build -o /go/bin/ ./cmd/...
RUN ls -ltr /go/bin

# final stage
FROM alpine:3.12

RUN apk --no-cache add ca-certificates

COPY --from=go-builder /go/bin/tunneld /go/bin/tunnel /usr/bin/


FROM --platform=$BUILDPLATFORM quay.io/projectquay/golang:1.20

ARG BUILDPLATFORM

WORKDIR /app

COPY . .

RUN make $BUILDPLATFORM

RUN make test
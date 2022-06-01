ARG ALPINE_VERSION=3.15
ARG GO_VERSION=1.16.15


FROM golang:${GO_VERSION}-alpine as base

RUN apk update && apk add postgresql git gcc libc-dev
ENV CGO_ENABLED=0
RUN go get github.com/rubenv/sql-migrate/... && echo $GOPATH && pwd



## Image
FROM alpine:${ALPINE_VERSION} as image

COPY --from=base /go/bin/sql-migrate /usr/local/bin/sql-migrate
RUN chmod +x /usr/local/bin/sql-migrate

ENV GOPATH=/usr/local/

ENTRYPOINT ["sql-migrate"]
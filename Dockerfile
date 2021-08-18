# ARG ALPINE_VERSION=3.12

# FROM golang:alpine${ALPINE_VERSION} as base

# RUN apk update && apk add postgresql git gcc libc-dev
# ENV CGO_ENABLED=0
# RUN pwd && go get github.com/rubenv/sql-migrate/...
# RUN which sql-migrate
# RUN ls $GOPATH



# ### Image
# FROM alpine:${ALPINE_VERSION} as image

# ENV GOPATH=/root/go

# COPY --from=base $GOPATH/sql-migrate /usr/local/bin/sql-migrate
# RUN chmod +x /usr/local/bin/sql-migrate

# ENV GOPATH=/usr/local/

# ENTRYPOINT ["sql-migrate"]

FROM golang:1.13-alpine

RUN apk update && apk add postgresql git gcc libc-dev
ENV CGO_ENABLED=0
RUN go get github.com/rubenv/sql-migrate/...

ENV GOPATH=/root/go

WORKDIR /migrations
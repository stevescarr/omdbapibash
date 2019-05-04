FROM alpine:3.7

RUN apk update
RUN apk upgrade
RUN apk add bash jq curl

RUN mkdir -p /opt/omdbapi

COPY ./*.sh /opt/omdbapi/

WORKDIR /opt/omdbapi
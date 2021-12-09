#
# Copyright © 2020 Thomas Harr. All rights reserved.
# Use of this source code is governed by MIT license
# that can be found in the LICENSE file.
#

FROM alpine:latest

LABEL maintainer="Thomas Harr <xdevthomas@gmail.com>" \
  url="xdevcloud.de"

RUN apk update && \
  apk upgrade -a && \
  apk add --no-cache \
  curl \
  git \
  make \
  libc6-compat \
  libstdc++ \
  openssh-client \
  rsync && \
  rm -rf /var/cache/apk/*

ENV VERSION 0.90.0

RUN mkdir -p /usr/local/src && \
  cd /usr/local/src && \
  curl -L https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_extended_${VERSION}_Linux-64bit.tar.gz | tar -xz && \
  mv hugo /usr/local/bin/hugo && \
  curl -L https://github.com/tdewolff/minify/releases/download/v2.9.10/minify_linux_amd64.tar.gz | tar -xz && \
  mv minify /usr/local/bin/ && \
  addgroup -Sg 1000 hugo && \
  adduser -SG hugo -u 1000 -h /src hugo

WORKDIR /src

EXPOSE 1313

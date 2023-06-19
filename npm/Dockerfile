#
# Copyright © 2023 Thomas Harr. All rights reserved.
# Use of this source code is governed by MIT license
# that can be found in the LICENSE file.
#

FROM xdevbase/hugo-builder:0.114

LABEL maintainer="Thomas Harr <xdevthomas@gmail.com>" \
    url="xdevcloud.de"

RUN apk update && \
    apk upgrade -a && \
    apk add --no-cache \
    npm && \
    rm -rf /var/cache/apk/*

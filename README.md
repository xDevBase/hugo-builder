# Hugo Builder Image

[![Docker Automated build](https://img.shields.io/docker/automated/xdevbase/hugo-builder.svg)](https://store.docker.com/community/images/xdevbase/hugo-builder)
[![Docker Pulls](https://img.shields.io/docker/pulls/xdevbase/hugo-builder.svg)](https://store.docker.com/community/images/xdevbase/hugo-builder)
[![GitHub](https://img.shields.io/github/license/xdevbase/hugo-builder.svg)](https://img.shields.io/github/license/xdevbase/hugo-builder)

This project originated from the great work of [Julien Guyomard](https://github.com/jguyomard) and his [Hugo Docker Image](https://github.com/jguyomard/docker-hugo). Unfortunately, it seems like the original project is no longer being maintained

[Hugo](https://gohugo.io/) is a fast and flexible static site generator, written in Go.
Hugo flexibly works with many formats and is ideal for blogs, docs, portfolios and much more.
Hugo’s speed fosters creativity and makes building a website fun again.

The focus of this lightweight Alpine based Docker Image is on Continuous Deployment.

## 📝 Get Started

### Print additional help information

```bash
docker run --rm -it xdevbase/hugo-builder hugo help
```

### Create a new static Site

Detailed information that are used here can be found on the [Hugo Quick Start Guide](https://gohugo.io/getting-started/quick-start/)

```bash
docker run --rm -it -v $PWD:/src -u hugo xdevbase/hugo-builder hugo new site mysite
```

### Add a Hugo Theme

Select a theme from [themes.gohugo.io](https://themes.gohugo.io/). This example takes the [Ananke theme](https://themes.gohugo.io/gohugo-theme-ananke/).

```bash
cd mysite
git init
git submodule add https://github.com/budparr/gohugo-theme-ananke.git themes/ananke;
echo 'theme = "ananke"' >> config.toml
```

### Add some Content

```bash
docker run --rm -it -v $PWD:/src -u hugo xdevbase/hugo-builder hugo new posts/my-first-post.md
```

Add content to this post with your preferred text editor `$PWD/content/posts/my-first-post.md`

Change the "draft" flag from `true` to `false`:

```Markdown
---
title: "My First Post"
date: 2020-12-20T10:00:00+01:00
draft: false
---

# Content here
```

### Build your Site

```bash
docker run --rm -it -v $PWD:/src -u hugo xdevbase/hugo-builder hugo
```

### Start the Hugo Server locally:

```bash
docker run --rm -it -v $PWD:/src -p 1313:1313 -u hugo xdevbase/hugo-builder hugo server -D -w --bind=0.0.0.0
```

Then open [`http://localhost:1313/`](http://localhost:1313/) in your browser.

For further information, read the [Hugo documentation](https://gohugo.io/documentation/).

## 🚚 Continuous Deployment

I use this Docker image for Continuous Deployment. You can find some CI config examples in the [`ci-example`](https://github.com/xdevbase/hugo-builder/tree/master/ci-example) directory.

The Docker image `latest` and `x.xx` version comes with:

- rsync
- git
- make
- openssh-client
- [minify](https://github.com/tdewolff/minify)

The Docker image `latest-npm` and `x.xx-npm` comes with:

- npm

## 🏷 Supported tags

The latest builds are:

- [`latest`](https://github.com/xdevbase/hugo-builder/blob/master/Dockerfile)
- [`latest-npm`](https://github.com/xdevbase/hugo-builder/blob/master/npm/Dockerfile)
- [`0.100`](https://github.com/xdevbase/hugo-builder/blob/v0.100.2/Dockerfile)
- [`0.100-npm`](https://github.com/xdevbase/hugo-builder/blob/v0.100.2/npm/Dockerfile)
- [`0.99`](https://github.com/xdevbase/hugo-builder/blob/v0.99.1/Dockerfile)
- [`0.99-npm`](https://github.com/xdevbase/hugo-builder/blob/v0.99.1/npm/Dockerfile)
- [`0.98`](https://github.com/xdevbase/hugo-builder/blob/v0.98.0/Dockerfile)
- [`0.98-npm`](https://github.com/xdevbase/hugo-builder/blob/v0.98.0/npm/Dockerfile)

A complete list of available tags can be found on the [docker hub page](https://hub.docker.com/r/xdevbase/hugo-builder/tags).

## 🧑‍💻 Users

By default, this docker image run as the root user. This makes it easy to use as base image for other Dockerfiles (switching back and forth adds extra layers and is against the current [best practices](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#user) advised by Docker). Most (all official?) base images leave the default user as root.

However, this docker image also define a non-root user `hugo` (UID 1000, GID 1000) which can be switched on at run time using the `--user` or `-u` flag to `docker run`.

```bash
docker run --rm -it -v $PWD:/src --user hugo xdevbase/hugo-builder hugo
```

You can also change this according your needs, by setting another UID/GID. For instance, to run hugo with user `www-data:www-data` (UID 33, GID 33) :

```bash
docker run --rm -it -v $PWD:/src -u 33:33 xdevbase/hugo-builder hugo
```

## 🐞 Issues

If you have any problems with or questions about this docker image, please contact me through a [GitHub issue](https://github.com/xdevbase/hugo-builder/issues).
If the issue is related to Hugo itself, please leave an issue on the [Hugo official repository](https://github.com/spf13/hugo).

## 👪 Contributing

You are invited to contribute new features, fixes or updates to this container, through a [Github Pull Request](https://github.com/xdevbase/hugo-builder/pulls).

## 📜 License

Copyright (c) 2020 Thomas Harr. Released under the MIT License. See [LICENSE][license] for details.

[license]: LICENSE

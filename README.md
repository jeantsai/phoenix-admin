# Develop Phoenix applications in Docker containers

> Want to try Phoenix 1.4 before its official releasing? this project make you able to try Phoenix of the latest version from its master branch through a Docker container based on Alpine, without potential conflicts with your current working on production versions of Phoenix.

![phoenix logo](https://raw.githubusercontent.com/phoenixframework/phoenix/master/priv/static/phoenix.png)


# Introduction

This a Docker image for try next release of Phoenix framework before its official releasing. Currently, Phoenix 1.4 could be tried before it may be released later this year.


# Usage

## Download or clone this project

Download or clone this project into a local system with Docker runtime having been installed already.

Just start the latest Phoenix server through Docker Compose:

```bash
docker-compose up -d
```

> Don't forget stop and close the Phoenix container after your finish your working. Just treat is as a part of you IDE for Phoenix developments.

```bash
docker-compose down
```


# License

MIT © [Jun Cai](https://github.com/jeantsai)
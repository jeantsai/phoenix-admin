FROM jeantsai/elixir-node-alpine

RUN PHOENIX_DOWNLOAD_URL="https://github.com/phoenixframework/phoenix/archive/master.zip" \
	&& buildDeps=' \
		ca-certificates \
		curl \
		unzip \
	' \
	&& apk add --no-cache --virtual .build-deps $buildDeps \
	&& curl -fSL -o phoenix.zip $PHOENIX_DOWNLOAD_URL \
	&& unzip phoenix.zip \
	&& rm phoenix.zip \
	&& apk del .build-deps \
    && mix local.hex --force \
    && apk add --no-cache git openssh bash bash-doc bash-completion \
    && cd phoenix-master/installer \
    && echo 'Y' | MIX_ENV=prod mix do archive.build, archive.install \
	&& apk add --no-cache inotify-tools

VOLUME /app
WORKDIR /app

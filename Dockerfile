FROM dashpay/dashd:latest

USER root

RUN set -ex \
	&& apt-get update \
	&& apt-get install -qq --no-install-recommends gosu \
	&& rm -rf /var/lib/apt/lists/*

COPY docker-entrypoint.sh /usr/local/bin/

USER dash

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["dashd"]

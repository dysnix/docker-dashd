FROM debian:stretch-slim

ENV DASHD_VERSION 0.14.0.3

ENV DASH_URL https://github.com/dashpay/dash/releases/download/v${DASHD_VERSION}/dashcore-$DASHD_VERSION-x86_64-linux-gnu.tar.gz 

ARG USER_ID
ARG GROUP_ID

ENV HOME /home/dash

# add user with specified (or default) user/group ids
ENV USER_ID ${USER_ID:-1000}
ENV GROUP_ID ${GROUP_ID:-1000}

RUN groupadd -g ${GROUP_ID} dash \
	&& useradd -u ${USER_ID} -g dash -s /bin/bash -m -d ${HOME} dash

RUN set -ex \
	&& apt-get update \
	&& apt-get install -qq --no-install-recommends ca-certificates wget gosu \
	&& rm -rf /var/lib/apt/lists/*

# install dash binaries
RUN set -ex \
	&& cd /tmp \
	&& wget -qO dash.tar.gz "$DASH_URL" \
	&& tar -xzvf dash.tar.gz -C /usr/local --strip-components=1 --exclude=*-qt \
	&& rm -rf /tmp/*

EXPOSE 9998 9999 19998 19999

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["dashd"]

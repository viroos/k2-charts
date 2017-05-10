FROM nginx
MAINTAINER Samsung CNCT <john.felten@gmail.com>

USER root

# install apache, gcsfuse
RUN apt-get -y update \
  && apt-get -y install curl \
  && apt-get -y install gnupg \
	&& echo "deb http://packages.cloud.google.com/apt gcsfuse-jessie main" | tee /etc/apt/sources.list.d/gcsfuse.list \
	&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
	&& apt-get -y update \
	&& apt-get -y install gcsfuse \
	&& rm -f /usr/share/nginx/html/*
EXPOSE 80

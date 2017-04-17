FROM nginx
MAINTAINER Samsung CNCT <john.felten@gmail.com>

USER root

# install apache, gcsfuse
RUN apt-get -y update \
    && apt-get -y install curl lsb-release \
    && export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` \
	&& echo "deb http://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list \
	&& curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
	&& apt-get -y update \
	&& apt-get -y install gcsfuse \
	&& rm -f /usr/share/nginx/html/*
EXPOSE 80

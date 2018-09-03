FROM alpine
MAINTAINER Dmitrii Ageev <d.ageev@gmail.com>

RUN apk -v --update add \
         python \
         py-pip \
         groff \
         less \
         mailcap \
    && pip install --upgrade awscli s3cmd \
    && apk -v --purge del py-pip \
    && rm /var/cache/apk/*

VOLUME /root/.aws
VOLUME /workdir
WORKDIR /workdir

ENTRYPOINT ["aws"]

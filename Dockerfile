FROM openjdk:8-jre-alpine

ENV ATD_VERSION 081310

RUN apk update && \
 apk add curl tar && \
 cd /srv && \
 curl http://www.polishmywriting.com/download/atd_distribution${ATD_VERSION}.tgz | tar -xz && \
 chmod -R a+x /srv/atd  && \
 sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /srv/atd/run.sh && \
 rm -rf /var/cache/apk/*

EXPOSE 1049

WORKDIR /srv/atd

CMD ./run.sh

FROM java:8-jre

RUN apt-get update \
 && apt-get install -y --no-install-recommends curl

ENV ATD_VERSION 081310

RUN cd /srv \
 && echo "==> Downloading and installing After The Deadline Server..." \
 && curl http://www.polishmywriting.com/download/atd_distribution${ATD_VERSION}.tgz | tar -xz \
 && chmod -R a+x /srv/atd \
 && sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /srv/atd/run.sh

EXPOSE 1049

WORKDIR /srv/atd

CMD ./run.sh

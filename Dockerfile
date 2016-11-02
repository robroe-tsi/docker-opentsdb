# Pull base image.
FROM bigboards/cdh-base-x86_64

MAINTAINER robroetsi
USER root 

RUN apt-get update \
    && apt-get install -y git gnuplot autotools-dev autoconf make python \
    && apt-get clean \
    && apt-get autoclean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/apt/archives/* \
    && cd /usr/lib \
    && git clone https://github.com/OpenTSDB/opentsdb.git \
    && cd opentsdb \
    && ./build.sh \
    && cd build \
    && make install

ADD docker_files/opentsdb-run.sh /apps/opentsdb-run.sh
ADD docker_files/debug-run.sh /apps/debug-run.sh

RUN chmod a+x /apps/*.sh

EXPOSE 4242

CMD ["/bin/bash"]
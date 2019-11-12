# docker build --build-arg PATH_TO_ELASTICSEARCH='' -t my-es-node:latest .
FROM openjdk:12

# Build time args
ARG PATH_TO_ELASTICSEARCH

# Intended to be provided by runner
ENV NODE_NR=""
ENV DISCOVERY_SEEDS=""

# Default values for environment
ENV DATA="/data"
ENV LOGS="/logs"


RUN groupadd -g 999 appuser && \
    useradd -r -u 999 -g appuser appuser

RUN mkdir $DATA $LOGS && \
chown -R appuser:appuser $DATA && \
chown -R appuser:appuser $LOGS

ADD --chown=appuser:appuser $PATH_TO_ELASTICSEARCH /elasticsearch

USER appuser

CMD ["/elasticsearch/bin/elasticsearch", "-Epath.data=${DATA}", "-Epath.logs=${LOGS}", "-Enode.name=node-${NODE_NR}", "-Ehttp.port=920${NODE_NR}", "-Enetwork.host=0.0.0.0", "-Enode.master=true", "-Expack.ml.enabled=false", "-Expack.security.enabled=false", "-Ediscovery.seed_hosts=${DISCOVERY_SEEDS}"]
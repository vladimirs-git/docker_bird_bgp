FROM debian:buster

ENV BIRD_USER=bird
ENV BIRD_GROUP=bird
ENV BIRD_DIR=/run/bird
ENV BIRD_ARGS=""


RUN apt-get update && \
    apt-get install -y bird procps inetutils-traceroute

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh && \
    mkdir -p ${BIRD_DIR} && \
    chmod 775 ${BIRD_DIR} && \
    chown --silent ${BIRD_USER}:${BIRD_GROUP} ${BIRD_DIR}

CMD ["/entrypoint.sh"]

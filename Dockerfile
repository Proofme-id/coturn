FROM ubuntu:20.04
MAINTAINER ProofMe <info@proofme.id>

RUN apt-get update && apt-get install -y coturn && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV TURN_PORT 3478
ENV TURN_PORT_START 49152
ENV TURN_PORT_END 65535
ENV TURN_SECRET mysecret
ENV TURN_SERVER_NAME proofme
ENV TURN_REALM proofme.id

ADD start.sh start.sh
ADD version.json version.json
RUN chmod +x start.sh

CMD ["./start.sh"]

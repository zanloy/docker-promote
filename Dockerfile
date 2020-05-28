FROM docker:19.03.9-dind
LABEL maintainer 'Zan Loy'

ENV DOCKER_HOST unix:///var/run/docker.sock

# Add necessary dependencies
RUN apk add --no-cache bash

# Copy repository certs
COPY certs/* /etc/docker/certs.d/

# Copy in script to run
COPY promote.sh .

ENTRYPOINT ["/usr/local/bin/dockerd-entrypoint.sh"]

CMD ["/bin/bash", "-c", "/promote.sh"]
#CMD ["/bin/bash", "-c", "docker ps"]

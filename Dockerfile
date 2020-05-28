FROM docker:19.03.9-dind
LABEL maintainer 'Zan Loy'

# Copy repository certs
COPY certs/* /etc/docker/certs.d/

# Copy in script to run
COPY promote.sh /promote.sh

CMD ['/promote.sh']

FROM ubuntu:22.04
RUN apt-get update && apt-get install -y procps
COPY health-check-v2.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/health-check-v2.sh
CMD ["/usr/local/bin/health-check-v2.sh"]

FROM docker.io/elastic/logstash:7.16.2



RUN rm -f /usr/share/logstash/pipeline/logstash.conf
COPY ./pipeline/logstash.conf /usr/share/logstash/pipeline/
COPY ./config/logstash.yml /usr/share/logstash/config/

COPY ./pipeline/elasticsearch-ca.pem /usr/share/logstash/config/

USER root
RUN chown logstash:logstash /usr/share/logstash/config/logstash.yml

USER logstash
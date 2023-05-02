FROM docker.io/elastic/logstash:7.10.0



RUN rm -f /usr/share/logstash/pipeline/logstash.conf
COPY ./pipeline/logstash.conf /usr/share/logstash/pipeline/
COPY ./config/logstash.yml /usr/share/logstash/config/

COPY ./65562368-53e5-4473-99ef-faefeeffd5c9 /65562368-53e5-4473-99ef-faefeeffd5c9

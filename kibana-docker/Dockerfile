FROM docker.io/elastic/kibana:7.10.2



RUN rm -f /usr/share/kibana/config/kibana.yml
COPY ./kibana.yml /usr/share/kibana/config/
COPY ./65562368-53e5-4473-99ef-faefeeffd5c9.crt /usr/share/kibana/config/


FROM docker.io/elastic/kibana:7.16.2



RUN rm -f /usr/share/kibana/config/kibana.yml
COPY ./kibana.yml /usr/share/kibana/config/
COPY ./elasticsearch-ca.pem /usr/share/kibana/config/

USER root
RUN chown -R kibana:kibana /usr/share/kibana/config/*

USER kibana

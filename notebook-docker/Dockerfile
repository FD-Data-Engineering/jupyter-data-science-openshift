FROM jpacerqueira83/jupyter_datascience:latest-stable-version-2.4.5

RUN wget https://github.com/openshift/okd/releases/download/4.5.0-0.okd-2020-07-14-153706-ga/openshift-client-linux-4.5.0-0.okd-2020-07-14-153706-ga.tar.gz \
    && tar -xvf openshift-client-linux-4.5.0-0.okd-2020-07-14-153706-ga.tar.gz \
    && mv oc /usr/local/bin/
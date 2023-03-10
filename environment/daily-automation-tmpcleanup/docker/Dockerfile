FROM alpine:latest

ENV OC_VERSION "v3.11.0"
ENV OC_RELEASE "openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit"
# ENV USER_ID=999
# ENV GROUP_ID=1000
# ENV NOTEBOOK_HOME=notebookuser
# ENV NOTEBOOK_GROUP_NAME=notebookuser
# ENV NOTEBOOK_USER=notebookuser

# ARG NOTEBOOK_HOME="/home/notebookuser/notebooks"

# RUN addgroup -g $GROUP_ID $NOTEBOOK_GROUP_NAME && \
#     # adduser --shell /sbin/nologin --disabled-password --uid $USER_ID --ingroup $NOTEBOOK_GROUP_NAME $NOTEBOOK_HOME
#     adduser -m -d $NOTEBOOK_HOME $NOTEBOOK_USER



RUN \
    apk add --no-cache \
    bash \
    jq \
    yq \
    make \
    python3 \
    py-pip \
    zip \
    sed \
    gawk \
    gpg \
    curl \
    && curl -sL https://iascable.cloudnativetoolkit.dev/install.sh | sh 

ADD https://github.com/openshift/origin/releases/download/$OC_VERSION/$OC_RELEASE.tar.gz /opt/oc/release.tar.gz
RUN apk add --no-cache ca-certificates
RUN tar --strip-components=1 -xzvf  /opt/oc/release.tar.gz -C /opt/oc/ && \
    mv /opt/oc/oc /usr/bin/ && \
    rm -rf /opt/oc

COPY script/daily-automation-tmpcleanup.sh /daily-automation-tmpcleanup.sh

# RUN chgrp -R 0 $NOTEBOOK_HOME && \
#     chmod -R g=u $NOTEBOOK_USER

ENTRYPOINT ["/bin/sh", "/daily-automation-tmpcleanup.sh"]
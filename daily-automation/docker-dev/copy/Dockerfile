FROM python:3.7-slim-buster
LABEL maintainer="Puckel_"

# Never prompt the user for choices on installation/configuration of packages
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

ARG PYTHON_DEPS=""
ARG SCRIPT_PATH=/usr/local/sysadmin

# Define en_US.
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LC_CTYPE en_US.UTF-8
ENV LC_MESSAGES en_US.UTF-8

# Disable noisy "Handling signal" log messages:
# ENV GUNICORN_CMD_ARGS --log-level WARNING

RUN set -ex \
    && buildDeps=' \
    freetds-dev \
    libkrb5-dev \
    libsasl2-dev \
    libssl-dev \
    libffi-dev \
    libpq-dev \
    ' \
    && apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends \
    && apt-get install -y git \
    $buildDeps \
    freetds-bin \
    build-essential \
    default-libmysqlclient-dev \
    apt-utils \
    curl \
    rsync \
    netcat \
    locales \
    wget \
    curl \
    python-pip \
    python3-pip \
    python3-pyqt5 \
    tzdata \
    net-tools \
    iptables \
    iptables-persistent \
    wget \
    zip \
    unzip \
    tar \
    bzip2 \ 
    python-qt4 \
    software-properties-common \
    && sed -i 's/^# en_US.UTF-8 UTF-8$/en_US.UTF-8 UTF-8/g' /etc/locale.gen \
    && locale-gen \
    && update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 \
    && useradd -ms /bin/bash -d ${SCRIPT_PATH} sysadmin \
    && pip install -U pip setuptools wheel \
    && pip install pytz \
    && pip install pyOpenSSL \
    && pip install ndg-httpsclient \
    && pip install pyasn1 \
    && wget https://github.com/openshift/okd/releases/download/4.5.0-0.okd-2020-07-14-153706-ga/openshift-client-linux-4.5.0-0.okd-2020-07-14-153706-ga.tar.gz \
    && tar -xvf openshift-client-linux-4.5.0-0.okd-2020-07-14-153706-ga.tar.gz \
    && mv oc /usr/local/bin/ \
    && if [ -n "${PYTHON_DEPS}" ]; then pip install ${PYTHON_DEPS}; fi \
    && apt-get purge --auto-remove -yqq $buildDeps \
    && apt-get autoremove -yqq --purge \
    && apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

COPY ../script/copy-notebooks.sh /copy-notebooks.sh

RUN chown -R sysadmin: ${SCRIPT_PATH}

RUN chgrp -R 0 $SCRIPT_PATH && \
    chmod -R g=u $SCRIPT_PATH

USER sysadmin
WORKDIR ${SCRIPT_PATH}
ENTRYPOINT ["/bin/sh", "/copy-notebooks.sh"]
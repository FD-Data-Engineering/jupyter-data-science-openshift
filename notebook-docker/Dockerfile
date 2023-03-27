FROM jpacerqueira83/jupyter_datascience:latest-stable-version-2.4.5

USER root
RUN wget https://github.com/openshift/okd/releases/download/4.5.0-0.okd-2020-07-14-153706-ga/openshift-client-linux-4.5.0-0.okd-2020-07-14-153706-ga.tar.gz \
    && tar -xvf openshift-client-linux-4.5.0-0.okd-2020-07-14-153706-ga.tar.gz \
    && mv oc /usr/local/bin/ 
# RUN  sleep 1 ; export HOME=/home/notebookuser ; \
#      sudo chown notebookuser:notebookuser -R $HOME ; \
#      sleep 2 ; \
#      sudo rm -rf /tmp/* ; 

RUN usermod -aG root notebookuser

USER notebookuser
# CMD sleep 5 ; \
#     export HOME=/home/notebookuser ; cd $HOME ; \
#     bash -x $HOME/library_tools/install-jupyter-support-packs.sh ; \
#     bash -x $HOME/library_tools/R-lang-workarround.sh ; \
#     bash -x $HOME/start-jupyter.sh ; \
#     sudo service cron reload ; \
#     tail -n 30 $HOME/notebooks/jupyter.log ; \
#     sleep infinity
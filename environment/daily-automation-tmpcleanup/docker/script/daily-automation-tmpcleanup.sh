#!/usr/bin/env bash
#
pod_name=$(oc get pod prod-jupyter-data-science --output=name | sed -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//')

oc exec $pod_name -- bash -c '
        echo "Establishing connection to '$pod_name'"
        cd /tmp  && rm -rf  /tmp/*
        sleep 5
        rm -rf  /tmp/*
'
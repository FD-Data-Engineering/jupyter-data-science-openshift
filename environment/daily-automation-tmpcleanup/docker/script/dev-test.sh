#!/usr/bin/env bash
#
pod_name=$(oc get pod dev-jupyter-data-science --output=name | sed -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//')

oc exec $pod_name -- bash -c '
        echo "Establishing connection to '$pod_name'"
        sleep 5
        echo "Established connection to '$pod_name'"
        pwd
        mkdir /notebooks-pv/"$(date +"%d-%m-%Y")"

        cp -r /home/notebookuser /notebooks-pv/"$(date +"%d-%m-%Y")"/

        find /notebooks-pv/* -mtime +1 -exec rm {} \;
'












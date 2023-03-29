#!/usr/bin/env bash
#
pod_name=$(oc get pod dev-jupyter-data-science --output=name | sed -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//')
date=$(date --date "-2 days" +"%d-%m-%Y")
oc exec $pod_name -- bash -c '
        echo "Establishing connection to '$pod_name'"
        sleep 5
        echo "deleting notebooks in '$date' dir"
        rm -rf /notebooks-pv/'$date'
        echo "Established connection to '$pod_name'"
        pwd
        mkdir /notebooks-pv/"$(date +"%d-%m-%Y")"
        cp -r /home/notebookuser /notebooks-pv/"$(date +"%d-%m-%Y")"/
        echo "notebooks have been copied successfully to notebooks-pv"
'



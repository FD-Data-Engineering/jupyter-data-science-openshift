#!/usr/bin/env bash
#
pod_name=$(oc get pod prod-jupyter-data-science --output=name | sed -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//' -e 's/^[[pod/]]*//')
date=$(date --date "-0 days" +"%d-%m-%Y")
oc exec $pod_name -- bash -c '
        echo "Establishing connection to '$pod_name'"
        sleep 5
        echo "Established connection to '$pod_name'"
        echo "Restoring notebooks for '$date' dir"
        cp -r /notebooks-pv/'$date'/* /home/
        echo "notebooks have been copied successfully"
'








# Update certs for OpenShift Routes

# Background 
we need to Update Openshift route certs to make routing service secured, so we need to generate new certs, on expiry if existing ones.

Right now, we are approaching procedure to use existing Openshift secrets to generate tls.key tls.crt files and replace keys with existing route.yaml files.

# Good to know
As of now (5th June 2023) current Openshift secrets are renewing for every 90 days/3 months with default value. 

# Steps for execution 
Run from IBM cloud Shell/OC CLI

1.Extract secrets
Ex: oc extract <secretname> --to=<filelocationtosave> -n <namespace>

In our use case this will be something like this 
**oc extract secret/devsfcluster-56118b4b985711fc98241a723e4ef72a-0000 --to=/home/mpolisetty -n openshift-ingress**

2.This will generate tls.key tls.crt files in defined location 

3.Redirect to environment (dev/prod (or) relevant route.yaml file where certs need to be renewed) > route.yaml and replace .crt and .key values

4.Git push > Argo CD auto sync will do continuous delivery and update certs (IF Auto sync not enabled then do manual prune and force from Argo CD)


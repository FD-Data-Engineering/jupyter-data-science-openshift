
# This is step by step process (Manual) to Sync notebooks form DEV environment to PROD 

# Good to Know (as of 7th June 23)
1.All Engineers should use DEV environment for deployment and updates
2.Every week wednesday and Friday below steps will be performed to sync notebooks from DEV to PROD 

# Steps

1.Login to **Dev** Jupyter notebook terminal - https://dev-jupyter-data-science.devsfcluster-56118b4b985711fc98241a723e4ef72a-0000.eu-de.containers.appdomain.cloud/

2.Go to #cd /home/notebookuser/

3.Run the below command 

#tar -zcvf notebooks-**Dev**_bkp_**Date**.tar.gz notebooks

4.Move the notebooks backup file to /home/notebookuser/notebooks

#mv notebooks-**Dev**_bkp_**Date**.tar.gz file  /home/notebookuser/notebooks

5.Download notebooks-**Dev**_bkp_**Date**.tar.gz file from https://dev-jupyter-data-science.devsfcluster-56118b4b985711fc98241a723e4ef72a-0000.eu-de.containers.appdomain.cloud/

#backup.gz file eists in notebook main page

6.Login to **PROD** Jupyter notebook terminal and upload **DEV** backup 

#Upload notebooks-**Dev**_bkp_**Date**.tar.gz file to **PROD** - https://prod-jupyter-data-science.devsfcluster-56118b4b985711fc98241a723e4ef72a-0000.eu-de.containers.appdomain.cloud/

7.**For safer side please take notebooks backup on Prod as well!**
 
Login to Prod Jupyter notebook terminal

Go to cd /home/notebookuser/

Run the below commands 

#cd /home/notebookuser/ ; #tar -zcvf notebooks-**Prod**_bkp_**Date**.tar.gz notebooks

Move the notebooks-**Prod**_bkp_**Date**.tar.gz file to /notebooks-pv/

8.Execute below From **PROD** Jupyter terminal 

Go to /home/notebookuser/notebooks and move the notebooks-**Dev**_bkp_**Date**.tar.gz file to /notebooks-pv/

#cd /home/notebookuser/notebooks 

#mv notebooks-**Dev**_bkp_**Date**.tar.gz /notebooks-pv/

Go to /notebooks-pv/

Untar the Dev tar file 

#tar -xvf notebooks-**Dev**_bkp_**Date**.tar.gz

Go to /notebooks-pv/notebooks and run below commands

#cd /notebooks-pv/notebooks ; 

#rm -r crontab nohup.out jupyter.log

Move /notebooks-pv/notebooks to /home/notebookuser/

Verify new Dev files on Prod node from UI 

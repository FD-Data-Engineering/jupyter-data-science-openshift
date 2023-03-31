# Jupyter-data-science-OpenShift node recovery process

# Background 
As of 31/3/23 there were some known issues on image disk/overlay which may destroy environment over the time but below procedure helps to recover/fix the environment quickly and run again! 

# Good to aware 
1.Initiated daily backups for notebooks, stored in Persistent Volume(PV) with size 50 GB and mounted as **/notebooks-pv** (for both DEV and PROD environments)

2.Daily backups scheduled with cron job (Dev -> copy-notebooks-job & Prod -> copy-prod-notebooks-job) running everyday mid night. In case of disaster, with newly implemented process will recover data from letest full backup.

3.PV will have only last two full backups (Daily backup job will delete backups which is older than 2 days)

4.Data Engineers, Data Scientists should sync-up their work in Git all the time 

5.There is limitation on size of data for Analysis 

# Recovery process for DEV

1.Delete the Data Science Pod and Create Pod(Argo CD automated process) 

2.Delete /home/notebookuser/notebooks/covid19 directory 

3.Stop Jupyter Process
  check running process: ps -ef
  Stop Jupyter process: **bash -x /home/notebookuser/stop-jupyter.sh**

4.Run/Create **restore-notebook** job from Openshift (It takes some time to restore from backup)

5.Start Jupyter process: **bash -x /home/notebookuser/start-jupyter.sh**

6.Start Jupyter process again to ensure jupyter service port is running on **9004** (Verify this from **/home/notebookuser/notebooks/jupyter.log**)

7.Find new jupyter access token from jupyter.log

# Recovery process for PROD

1.Delete the Data Science Pod and Create Pod(Argo CD automated process) 

2.Delete /home/notebookuser/notebooks/covid19 directory 

3.Stop Jupyter Process
  check running process: ps -ef
  Stop Jupyter process: **bash -x /home/notebookuser/stop-jupyter.sh**

4.Run/Create **restore-prod-notebook** job from Openshift (It takes some time to restore from backup)

5.Start Jupyter process: **bash -x /home/notebookuser/start-jupyter.sh**

6.Check jupyter service port is running on **9003** (Verify this from **/home/notebookuser/notebooks/jupyter.log**)

7.Find new jupyter access token from jupyter.log 



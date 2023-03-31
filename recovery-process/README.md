# Jupyter-data-science-openshift node recovery process

# Background 
As of 31/3/23 there were some known issues on image disk/overlay which may destory environment over the time but below procedure helps to recover/fix the environment quickly and run again ! 

# Good to aware 
1.we have initiated daily backups for notebooks, stored in PV (50 GB) and mounted as /notebooks-pv (for both DEV and PROD environments)

2.Daily backups scheduled with cron job (copy notebook job) and running every day mid night. In case of disastor, with newly implemetned process will recover data from last full backup.

3.PV will have only last two full backups (daily backup job will delete backups older than 2 days)

4.Data Engineers, Data Scientists should sync-up their work in Git all the time 

5.There is limitation on size of data for Analaysis 

# Recovery process for DEV

1.Delete Pod and Create Pod 

2.Delete Covid19 Folder 

3.stop Jupyter Process
  check running process : ps -ef
  Stop Jupyter process : ./stop-jupyter.sh (from /home/notebookuser)

4.Run/Create restore-prod-notebook job from Openshift (it takes some time for restore notebooks)

5.Start Jupyter process : ./start-jupyter.sh (from /home/notebookuser)

6.Start Jupyter process again to ensure jupyter servie port is running on # 9004 # (verify this from /home/notebookuser/notebooks/jupyter.log)

7.check jupyter.log for new access token 

# Recovery process for PROD

1.Delete Pod and Create Pod 

2.Delete Covid19 Folder 

3.stop Jupyter Process
  check running process : ps -ef
  Stop Jupyter process : ./stop-jupyter.sh (from /home/notebookuser)

4.Run/Create restore-prod-notebook job from Openshift (it will take some time for restore notebooks)

5.Start Jupyter process : ./start-jupyter.sh (from /home/notebookuser)

6.Check jupyter servie port is running on # 9003 # (verify this from /home/notebookuser/notebooks/jupyter.log)

7.check jupyter.log for new access token 


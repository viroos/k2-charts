# kraken-ci-chart

##Based loosely on kubernetes/hekm charts/stable/jenkins

##This chart will install a jenkins set up to run k2 test jobs.  I have tested in minikube, and will eventually modify this use be based on the helm base jenkins chart.  

##To change the job repo modify the Jenkins.Master.JobsRepo value to point to your repository.  It currently defaults to kraken jobs.

#!/bin/bash

#kubectl apply -f resources/jenkins.yaml
jenkins_port=$(kubectl get svc jenkins -o yaml | grep -o -e 'nodePort: \d*' | awk -F':' '{gsub(/^[ \t]+/, "", $2); print $2}')
jenkins_url="http://localhost:${jenkins_port}"
jenkins_pod=$(kubectl get pods -l='app=jenkins' -ojsonpath='{.items[0].metadata.name}')
token=`kubectl exec $jenkins_pod -- cat /var/jenkins_home/secrets/initialAdminPassword`
echo "Jenkins should be available at ${jenkins_url}"
echo "Jenkins intial token: $token"
echo "Using the above token, setup jenkins, create admin user and install Job DSL plugin"
echo "And do cd seed-job/ && ./run_seed_job.sh $jenkins_url <username> <password>"

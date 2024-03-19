# Airbnb-Clone-Jenkins
TECHNOLOGY: React App , AWS, ANSIBLE , JENKINS , DOCKER , SONARQUBE , TRIVY , PROMETHEUS , GRAFANA 


### **PHASE 1  Setup**

**Step 1: Launch EC2 (Ubuntu 22.04): Ansible Host MAchine**

-  Provision an EC2 instance on AWS with Ubuntu 22.04.
-  -  Connect to the instance using SSH.
   - Clone the code 
   -  Install Ansible  look on ansible.sh
   -  Make inventory of hosts  example inventory.yml
   -  Copy key for instance change permission chmod 600 keys

**Step 2 Install Tools on Jenkins Host by ansible jenkins.yml**
 -  go to ANSIBLE dir
 -   ansible-playbook -i inventory.yml jenkins.yml

 
 **Step 3  Install Prometheus and Grafana by Ansible**
   - ansible-playbook -i inventory monitoring.yml

 ** Step 4 Install Database by Ansible**
  - ansible-playbook -i inventory database.yml

### **PHASE 2  Configuration Jenkins**

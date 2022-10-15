#!/bin/bash
sudo yum update -y
sudo yum install wget -y
sudo yum install git -y
sudo yum install -y yum-utils
sudo yum install -y http://mirror.centos.org/centos/7/extras/x86_64/Packages/sshpass-1.06-2.el7.x86_64.rpm
sudo yum install sshpass -y
sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum upgrade -y
sudo yum install jenkins java-11-openjdk-devel -y --nobest
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum update -y
sudo yum install docker-ce docker-ce-cli containerd.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker ec2-user
sudo usermod -aG docker jenkins
echo "license_key: ${NewRelic}" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
sudo yum install newrelic-infra -y
sudo hostnamectl set-hostname Jenkins
sudo chmod -R 700 ~/.ssh
sudo chown -R ec2-user:ec2-user ~/.ssh
sudo su - ec2-user -c "ssh-keygen -f ~/.ssh/jenkinskey_rsa4 -t rsa -b 4096 -m PEM -N ''"
sudo bash -c 'echo "StrictHostKeyChecking No" >> /etc/ssh/ssh_config'
sudo sed -ie 's@jenkins:x:994:991:Jenkins Automation Server:/var/lib/jenkins:/bin/false@jenkins:x:994:991:Jenkins Automation Server:/var/lib/jenkins:/bin/bash@' /etc/passwd
sudo systemctl daemon-reload
sudo systemctl start jenkins
#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo yum update -y
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
sudo groupadd docker && sudo usermod -aG docker ec2-user
sudo su
echo "Admin123@" | sudo passwd ec2-user --stdin 
echo "ec2-user ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
sed -ie 's@PasswordAuthentication no@PasswordAuthentication yes@' /etc/ssh/sshd_config
chmod 600 ~/.ssh/authorized_keys
sudo systemctl enable docker
sudo systemctl start docker
echo "license_key: ${NewRelic}" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
sudo yum install newrelic-infra -y
sudo systemctl daemon-reload
sudo systemctl start docker
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo docker-compose -f /home/ec2-user/docker-compose.yml up -d
sudo service sshd restart
# the second line of code is to enable userdata for log
# parth /var/log/user-data.log
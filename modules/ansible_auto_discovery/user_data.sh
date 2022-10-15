#!/bin/bash
exec > >(tee /var/log/user-data.log|logger -t user-data -s 2>/dev/console) 2>&1
sudo yum update -y
sudo yum install python3 python3-pip -y
sudo pip3 install docker-py
sudo yum install ansible -y
sudo pip3 install boto boto3 botocore
sudo yum install -y yum-utils -y
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum install docker-ce docker-ce-cli docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker
cd /etc/ansible
sudo yum install unzip -y
sudo curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
sudo unzip awscliv2.zip
sudo ./aws/install
./aws/install -i /usr/local/aws-cli -b /usr/local/bin
sudo ./aws/install --bin-dir /usr/local/bin --install-dir /usr/local/aws-cli --update
sudo ln -svf /usr/local/bin/aws /usr/bin/aws
sudo yum install vim -y
sudo chown -R ec2-user:ec2-user /etc/ansible && chmod +x /etc/ansible
sudo hostnamectl set-hostname Ansible
sudo chown ec2-user:ec2-user /etc/hosts
echo "[docker_host]" >> /etc/ansible/hosts
sudo echo "${Dummy_pubIP} ansible_ssh_private_key_file=/home/ec2-user/test-key" >> /etc/ansible/hosts
sudo chmod 777 /etc/ansible/hosts
sudo mkdir /opt/auto-discovery
sudo chown -R ec2-user:ec2-user /opt/auto-discovery
sudo chmod -R 700 /opt/auto-discovery
sudo mv /home/ec2-user/auto-discovery/* /opt/auto-discovery
sudo -E pip3 install pexpect
ansible-playbook -v /opt/auto-discovery/encrypt_playbook.yml
sudo chown -R ec2-user:ec2-user /opt/auto-discovery
rm -rvf /home/ec2-user/auto-discovery
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
echo "license_key: ${NewRelic}" | sudo tee -a /etc/newrelic-infra.yml
sudo curl -o /etc/yum.repos.d/newrelic-infra.repo https://download.newrelic.com/infrastructure_agent/linux/yum/el/7/x86_64/newrelic-infra.repo
sudo yum -q makecache -y --disablerepo='*' --enablerepo='newrelic-infra'
sudo yum install newrelic-infra -y
sudo systemctl daemon-reload
#sudo dnf install http://ccrypt.sourceforge.net/download/1.11/ccrypt-1.11-1.x86_64.rpm -y
# ansible-playbook -e @/opt/auto-discovery/secrets.yml /opt/auto-discovery/discovery.yml --ask-vault-pass




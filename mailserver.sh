sudo DEBIAN_FRONTEND=noninteractive apt-get update -y 
sudo DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

sudo DEBIAN_FRONTEND=noninteractive apt-get install -y default-jdk
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y maven
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y dovecot-pop3d
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y postfix 
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y postfix 
sudo echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >>~/.bashrc
sudo echo "export PATH=$JAVA_HOME/bin:$PATH" >>~/.bashrc
sudo echo "source ~/.bashrc"

sudo mkdir -m 777 /home/ubuntu/kn1lab/Maildir
sudo mkdir -m 777 /home/ubuntu/kn1lab/Maildir/new
sudo mkdir -m 777 /home/ubuntu/kn1lab/Maildir/cur
sudo mkdir -m 777 /home/ubuntu/kn1lab/Maildir/tmp   

sudo rm -rf /etc/postfix
sudo cp -r /home/ubuntu/kn1labConfig/postfix/postfix /etc
sudo rm -rf /etc/dovecot
sudo cp -r /home/ubuntu/kn1labConfig/postfix/dovecot /etc
sudo rm -rf /etc/aliases
sudo cp -r /home/ubuntu/kn1labConfig/postfix/aliases /etc
sudo rm -rf /etc/aliases.db
sudo cp -r /home/ubuntu/kn1labConfig/postfix/aliases.db /etc
sudo rm -rf /etc/mailcap
sudo cp -r /home/ubuntu/kn1labConfig/postfix/mailcap /etc
sudo rm -rf /etc/mailcap.order
sudo cp -r /home/ubuntu/kn1labConfig/postfix/mailcap.order /etc
sudo rm -rf /etc/mailname
sudo cp -r /home/ubuntu/kn1labConfig/postfix/mailname /etc

sudo service dovecot restart
sudo service postfix restart

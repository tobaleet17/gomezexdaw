apt-get update
apt-get install -y apache2
sudo apt-get install -y git
if ! [ -L /var/www ]; then
  rm -rf /var/www
  ln -fs /vagrant /var/www
fi
exec /home/vagrant/prueba.sh

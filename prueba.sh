read -p "Por favor, pon la IP estatica para tu máquina: " ip
sudo  sed -i '16s/^/config.vm.network "private_network", ip: "'$ip'"\n/' /vagrant/Vagrantfile

read -p "Dime el nombre de tu sitio: " nombre
sudo cp /etc/apache2/sites-available/default /etc/apache2/sites-available/$nombre

mkdir /var/www/$nombre

echo "¿Qué web quieres habilitar/deshabilitar?"
select yn in "web1" "web2" "default" "$nombre" "salir" ; do
    case $yn in
        web1 ) sudo a2ensite primeraWeb; break;;
        $nombre ) sudo a2ensite $nombre; break;;
        default ) sudo a2dissite default; break;;
        salir ) exit;;
    esac
done


sudo /etc/init.d/apache2 reload

echo "Recuerda salir de la máquina y hacer un vagrant reload y provision"

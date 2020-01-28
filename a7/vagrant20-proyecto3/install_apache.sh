apt-get update
apt-get install -y apache2
rm -rf /var/www/html
ln -fs /vagrant /var/www/html
echo "<h1>Vagrant Proyecto 3</h1>" > /var/www/html/index.html
echo "<p>Curso2019-20</p>" >> /var/www/html/index.html
echo "<p>Aaron Rodriguez Perez</p>" >> /var/www/html/index.html

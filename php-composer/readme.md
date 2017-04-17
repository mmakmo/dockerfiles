# Docker container for Apache + PHP(PHPEnv) + Composer

## Preparation
```bash
# build docker image
sudo docker build . -t php-composer
# run docker container
sudo docker run -d -v {project directory}:/var/www/html/webapp -p 80:80 -p 9000:9000 -p 8888:8888 --name {container name} php-composer  tail -f /dev/null
#  @docker container
sudo docker exec {container name} /root/init_laravel.sh
#  @docker container
sudo docker exec {container name} /root/start_rtail.sh
```

## Usage
```bash
# watch Javascript code change @docker container
sudo docker exec {container name} npm run watch
```

## Other settings
### prepare laravel project @docker container
```
composer create-project --prefer-dist laravel/laravel ${PROJECT}
```

### php.ini location
```
/root/.phpenv/versions/7.1.4/etc/php.ini
```

### .htaccess setting
```bash
Options +FollowSymLinks
RewriteEngine On

RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^ index.php [L]
```

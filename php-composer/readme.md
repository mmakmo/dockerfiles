# Docker container for Apache + PHP(PHPEnv) + Composer

## Preparation
```bash
# build docker image
sudo docker build . -t apache-php-composer
# run docker container
sudo docker run -d -v {project directory}:/var/www/html/webapp -p 80:80 --name {container name} apache-php-composer  tail -f /dev/null
# restart apache @docker container
sudo docker exec {container name} httpd -k restart
# install required npm packages @docker container
sudo docker exec {container name} npm install
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

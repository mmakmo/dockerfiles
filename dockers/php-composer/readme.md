# Docker container for Apache + PHP(PHPEnv) + Composer

## Preparation
```bash
# build docker image
docker build . -t php-composer
# run docker container
docker run -d -v {project directory}:/var/www/html/webapp -p 80:80 -p 9001:9000 -p 8881:8881 --name {container name} php-composer  tail -f /dev/null
#  @docker container
docker exec {container name} /root/init_laravel.sh
#  @docker container
docker exec {container name} /root/start_rtail.sh
```

## Usage
```bash
# watch Javascript code change @docker container
docker exec {container name} npm run watch
```

## Other settings
### prepare laravel project @docker container
```
composer create-project --prefer-dist laravel/laravel ${PROJECT}
```

### php.ini location
```bash
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
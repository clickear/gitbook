# Docker



# 阿里云部署

- 部署nginx-proxy

  ```dockerfile
  docker run --detach \
      --name nginx-proxy \
  	--restart=always \
      --publish 80:80 \
      --publish 443:443 \
      --volume /etc/nginx/certs:/etc/nginx/certs \
      --volume /etc/nginx/vhost.d \
      --volume /usr/share/nginx/html \
      --volume /var/run/docker.sock:/tmp/docker.sock:ro \
      jwilder/nginx-proxy
  ```

- 部署https

  ```dockerfile
  docker run --detach \
      --name nginx-proxy-letsencrypt \
      --restart=always \
      --volumes-from  nginx-proxy \
      --volume /var/run/docker.sock:/var/run/docker.sock:ro \
      jrcs/letsencrypt-nginx-proxy-companion
  ```

- 部署mysql

  ```dockerfile
  docker run -d -p 3306:3306 \
  --restart always \
  --privileged=true \
  --name mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=858833crc \
  -e MYSQL_ROOT_PASSWORD=858833crc \
  -v /data/mysql/config/conf.d:/etc/mysql/conf.d \
  -v /data/mysql/data:/var/lib/mysql \
  mysql:5.7
  ```

- 部署admin

  ```dockerfile
  docker run --restart=always --expose 8080 -p 8080:8080 -e VIRTUAL_HOST=clickear.top,admin.clickear.top -e VIRTUAL_PORT=8080 -e LETSENCRYPT_HOST=clickear.top registry.cn-shenzhen.aliyuncs.com/clickear/renren_security:v0.1
  ```

- 部署gitbook

  ```dockerfile
  docker run --detach \
      -p 4000:80 \
      --expose 80 \
      --name gitbook \
      --restart=always \
      -v /data/gitbook/html:/usr/share/nginx/html:rw \
      --env "VIRTUAL_HOST=gitbook.clickear.top" \
      --env "LETSENCRYPT_HOST=gitbook.clickear.top" \
      --env "LETSENCRYPT_EMAIL=434647670@qq.com" \
      nginx
  ```

  
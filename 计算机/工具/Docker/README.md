# Docker



# 示例

+ [springboot-demo-java](https://github.com/xkcoding/spring-boot-demo/tree/7d1a310fe1b0f744de03248794b278f21426e7cd/spring-boot-demo-docker)

+ [postwoman - node](https://github.com/liyasthomas/postwoman/blob/master/Dockerfile)

  

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
  docker run -d --restart=always --expose 8080 -p 8080:8080 -e VIRTUAL_HOST=admin.clickear.top -e VIRTUAL_PORT=8080 -e LETSENCRYPT_HOST=admin.clickear.top --name admin registry.cn-shenzhen.aliyuncs.com/clickear/renren_security:v0.2
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

  

```dockerfile
docker run -d -p 8042:80 --name nextcloud -e VIRTUAL_HOST=explore.clickear.top  -e LETSENCRYPT_HOST=explore.clickear.top nextcloud
```

```bash
docker run --name static-nginx -v /data/nginx:/usr/share/nginx/html:ro -d -p 9122:80 nginx
```

```
   docker run --detach \
   --name xxl-job-admin \
   --restart=always \
   -e PARAMS="--spring.datasource.url=jdbc:mysql://112.74.40.80:3306/xxl_job?Unicode=true&characterEncoding=UTF-8 --spring.datasource.username=root --spring.datasource.password=123456" \
    -p 8097:8080 \
    --expose 8080 \
   --env "VIRTUAL_HOST=job.clickear.top" \
    --env "LETSENCRYPT_HOST=job.clickear.top" \
    --env "LETSENCRYPT_EMAIL=434647670@qq.com" \
   -v /data/xxljob:/data/applogs \
    xuxueli/xxl-job-admin:2.1.2
```



  docker run --detach \
   --name xxl-job-admin \
   --restart=always \
   -e PARAMS="--spring.datasource.url=jdbc:mysql://112.74.40.80:3306/xxl_job?Unicode=true&characterEncoding=UTF-8 --spring.datasource.username=root --spring.datasource.password=123456" \
    -p 8097:8080 \
    --expose 8080 \
   --env "VIRTUAL_HOST=job.clickear.top" \
    --env "LETSENCRYPT_HOST=job.clickear.top" \
    --env "LETSENCRYPT_EMAIL=434647670@qq.com" \
    xuxueli/xxl-job-admin:2.1.2

docker run --detach \
    -p 9123:80 \
    --expose 80 \
    --name static-index-nginx \
    --restart=always \
    -v /data/nginx/html:/usr/share/nginx/html:rw \
    --env "VIRTUAL_HOST=clickear.top" \
    --env "LETSENCRYPT_HOST=clickear.top" \
    --env "LETSENCRYPT_EMAIL=434647670@qq.com" \
    nginx




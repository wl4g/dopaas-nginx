## XCloud DoPaaS Nginx
> The nginx plugin of DoPaaS platform realizes the unified real-time configuration management


#### 1. Developer's guide
```
cd ~

# 1.1 Pull nginx.
git clone https://github.com/nginx/nginx.git
git checkout release-1.9.9

# 1.2 Pull DoPaaS nginx plugin.
git clone https://github.com/wl4g/xcloud-dopaas-nginx.git

# 1.3 Compile to gdb-debug execute package.
./dev_make.sh
```

Access testing: [http://localhost:8080/index.html](http://localhost:8080/index.html)

Notes! Directories structure
```
├── nginx
│   ├── auto
│   ├── client_body_temp
│   ├── conf
│   ├── contrib
│   ├── docs
│   ├── fastcgi_temp
│   ├── Makefile
│   ├── misc
│   ├── objs
│   ├── proxy_temp
│   ├── scgi_temp
│   ├── src
│   └── uwsgi_temp
├── xcloud-dopaas-nginx
│   ├── config
│   ├── dev_make.sh
│   ├── LICENSE
│   ├── nginx.conf
│   ├── ngx_http_dopaas_module.c
│   ├── openssl-1.1.0f
│   ├── pcre-8.32
│   ├── README_CN.md
│   └── zlib-1.2.5
```


[Debug environment configuration, Refer:](https://bygeek.cn/2018/04/18/set-up-debugging-envirronment-about-nginx/)

## XCloud DoPaaS Nginx
> DoPaaS平台的nginx插件，实现了统一实时的配置管理


#### 1. 开发指南
```
cd ~

# 1.1 拉取 nginx
git clone https://github.com/nginx/nginx.git
git checkout release-1.9.9

# 1.2 拉取 DoPaaS nginx 插件
git clone https://github.com/wl4g/xcloud-dopaas-nginx.git

# 1.3 编译为 gdb 模式的运行包
./dev_make.sh
```

访问测试：[http://localhost:8080/index.html](http://localhost:8080/index.html)

注意, 目录结构: 
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


[相关参考,debug环境搭建](https://bygeek.cn/2018/04/18/set-up-debugging-envirronment-about-nginx/)

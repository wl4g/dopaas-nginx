#!/bin/bash

#/*
# * Copyright 2017 ~ 2025 the original author or authors. <Wanglsir@gmail.com, 983708408@qq.com>
# *
# * Licensed under the Apache License, Version 2.0 (the "License");
# * you may not use this file except in compliance with the License.
# * You may obtain a copy of the License at
# *
# *      http://www.apache.org/licenses/LICENSE-2.0
# *
# * Unless required by applicable law or agreed to in writing, software
# * distributed under the License is distributed on an "AS IS" BASIS,
# * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# * See the License for the specific language governing permissions and
# * limitations under the License.
# */
# @see: http://nginx.org/en/linux_packages.html#RHEL-CentOS
#
# Directories structure:
#
# ├── nginx
# │   ├── auto
# │   ├── client_body_temp
# │   ├── conf
# │   ├── contrib
# │   ├── docs
# │   ├── fastcgi_temp
# │   ├── Makefile
# │   ├── misc
# │   ├── objs
# │   ├── proxy_temp
# │   ├── scgi_temp
# │   ├── src
# │   └── uwsgi_temp
# ├── xcloud-dopaas-nginx
# │   ├── config
# │   ├── dev_make.sh
# │   ├── LICENSE
# │   ├── nginx.conf
# │   ├── ngx_http_dopaas_module.c
# │   ├── openssl-1.1.0f
# │   ├── pcre-8.32
# │   ├── README_CN.md
# │   └── zlib-1.2.5


baseDir="$(cd "`dirname "$0"`"/..; pwd)"
cd $baseDir/nginx

# Force switch to compatible(e.g: zlib/pcre/openssl) branch version.
git reset --hard
git checkout release-1.19.2

# Cleanup already build files.(if necessary)
sudo mkdir -p $baseDir/logs
sudo rm -rf objs
sudo rm -rf Makefile
sudo rm -rf configure
sudo cp -Rf auto/configure .

# Copy vscode configuration.
sudo rm -rf $baseDir/nginx/.vscode
sudo cp -rf $baseDir/xcloud-dopaas-nginx/.vscode1 $baseDir/nginx/.vscode

# Copy testing nginx.conf.
sudo cp -rf $baseDir/xcloud-dopaas-nginx/nginx.conf $baseDir/nginx/conf/nginx.conf
sudo cp -rf $baseDir/xcloud-dopaas-nginx/html $baseDir/nginx/html

# Rebuild of DoPaaS nginx plugin module.
sudo ./configure --prefix=$baseDir/nginx \
--with-pcre="$baseDir/xcloud-dopaas-nginx/pcre-8.32/" \
--with-zlib="$baseDir/xcloud-dopaas-nginx/zlib-1.2.5/" \
--with-openssl="$baseDir/xcloud-dopaas-nginx/openssl-1.1.0f/" \
--with-debug \
--with-cc-opt='-g -O0' \
--add-module="$baseDir/xcloud-dopaas-nginx/"

sudo make -f Makefile

#--without-http_rewrite_module \
#--without-http_gzip_module \

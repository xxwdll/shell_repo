#!/bin/bash
yum -y install git
git config --global user.name xxwdll
git config --global user.email gqoyvf@163.com

wget --no-check-certificate https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/hexo_build.sh && bash hexo_build.sh
wget --no-check-certificate https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/hexo_conf.sh && bash hexo_conf.sh

rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && yum -y install nginx
systemctl enable nginx
wget --no-check-certificate https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/nginx_conf.sh && bash nginx_conf.sh

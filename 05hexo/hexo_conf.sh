#!/bin/bash
cd /usr/blog
wget --no-check-certificate https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/res/find.sh
wget --no-check-certificate https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/res/restart.sh
wget --no-check-certificate https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/res/update_blog.sh
chmod +x *.sh
npm install hexo-renderer-jade hexo-renderer-stylus
npm audit fix --force
git clone -b master https://github.com/Molunerfinn/hexo-theme-melody themes/melody
rm -f _config.yml
wget --no-check-certificate https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/res/_config.yml
mkdir -p /usr/blog/source/_data
wget -P /usr/blog/source/_data https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/res/source/_data/melody.yml
mkdir -p /usr/blog/source/categories
wget -P /usr/blog/source/categories https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/res/source/categories/index.md
mdkir -p /usr/blog/source/tags
wget -P /usr/blog/source/tags https://raw.githubusercontent.com/xxwdll/shell_repo/master/05hexo/res/source/tags/index.md
rm -rf /usr/blog/source/_posts
git clone git@github.com:xxwdll/myblog.git /usr/blog/source/_posts
firewall-cmd --add-port=4000/tcp --permanent
firewall-cmd --reload
bash /usr/blog/restart.sh
echo 'server has started!'

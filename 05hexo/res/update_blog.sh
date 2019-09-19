#!/bin/bash
cd /usr/blog/source/_posts
git fetch origin master:temp
git merge temp
git branch -d temp
sleep 1
sh /usr/blog/restart.sh

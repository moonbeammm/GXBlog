#!/bin/sh
set -e

echo "*********************** remove theme **********************"
rm -rf themes/yilia

echo "*********************** clone theme **********************"
git clone https://github.com/litten/hexo-theme-yilia.git themes/yilia

echo "*********************** copy theme config **********************"
cp -v themes/_config.yml themes/yilia/

echo "*********************** install hexo **********************"
npm install hexo --save

echo "*********************** install json-content **********************"
npm i hexo-generator-json-content --save

echo "*********************** install deployer-git **********************"
npm install --save hexo-deployer-git

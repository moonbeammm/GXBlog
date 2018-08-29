#!/bin/sh
set -e

echo "*********************** remove theme **********************"
rm -rf themes/yilia

echo "*********************** clone theme **********************"
git clone https://github.com/litten/hexo-theme-yilia.git themes/yilia

echo "*********************** copy theme config **********************"
cp -v themes/_config.yml themes/yilia/

echo "*********************** install plug-in **********************"
npm install


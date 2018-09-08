本仓库的作用为存储博客源代码.仓库存储在github上

但是本仓库生成的静态文件(html)存储在120.22.246.43服务器上

如果你的电脑上没有安装hexo.需先安装

$ sudo npm install -g hexo

# 发布文章

$ hexo clean && hexo g -d


# Note that: 必须做以下两件事


## 一.运行sh build.sh

build.sh脚本会帮你做以下4件事

### 1.拉取本仓库代码后需要手动拉取主题代码

#$ git clone https://github.com/MOxFIVE/yelee.git themes/Yelee

$ git clone https://github.com/litten/hexo-theme-yilia.git themes/yilia

### 2.修改yilia主题的配置文件

将themes文件夹里的_config.yml文件覆盖进themes/yilia/文件夹里

### 3.intall hexo

$ npm install



## 二.配置SSH

a).创建你电脑的SSH私钥/公钥

b).将SSH的公钥上传到服务器的git账户下~/.ssh/authorized_keys文件里.

c).配置你电脑的~/.ssh/config文件.(Host必须为git.sunxxxxx.com HostName即服务器的IP)



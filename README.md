本仓库的作用为存储博客源代码.仓库存储在github上

但是本仓库生成的静态文件(html)存储在47.52.250.43服务器上

# Note that:

### 1.拉取本仓库代码后需要手动拉取主题代码

#git clone https://github.com/MOxFIVE/yelee.git themes/Yelee

git clone https://github.com/litten/hexo-theme-yilia.git themes/yilia

### 2.修改yilia主题的配置文件

将themes文件夹里的_config.yml文件覆盖进themes/yilia/文件夹里

### 3.安装插件(在根目录执行)

npm i hexo-generator-json-content --save

### 4.安装git插件

npm install --save hexo-deployer-git

### 5.设置SSH

a).你的机器需要创建SSH的私钥/公钥

b).将SSH的公钥上传到服务器的git账户下~/.ssh/authorized_keys文件里.

c).配置你机器的~/.ssh/config文件.(Host必须为git.sunxxxxx.com HostName即服务器的IP) 

### 6.修改完文章执行以下指令即可

hexo clean && hexo g -d

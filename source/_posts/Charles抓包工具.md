---
title: Charles抓包工具
tags:
    - 工具
---

Update Log:
2017.10.31: 更新charles抓不到的情况总结.

# 一.是什么?

Charles是mac上的一款网络封包截取工具.可以帮助我们调试与服务器端的通讯.定位一些bug的原因.

# 二 .主要功能

1.拦截接口.查看服务端返回数据.

2.map local-拦截接口.篡改服务端返回的数据.来测试一些临界值.

3.rewrite-拦截接口.篡改服务端返回的http返回码.帮助我们测试接口错误的情况.

4.模拟慢网速状态.

<!--more-->

# 三.安装

[Charles破解版](http://www.waitsun.com/charles-4-0-2.html).下载后双击.拖入Application目录下即可.

# 四.使用方法:

## 1.拦截接口.查看服务端返回数据

#### 1)模拟器使用方法:

1.将Charles设为成代理服务器.

打开Charles.`工具栏->Proxy->Mac OS X Proxy`.如图勾选即可.
    
2.运行模拟器.这样模拟器所有的请求都会被Charles所拦截.

#### 2)真机使用方法:

1.获取本机的IP地址.

打开本机`系统偏好设置-网络`.如图即本机的IP地址.


![1.png](https://upload-images.jianshu.io/upload_images/1452166-68f03680fd9fd547.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.真机连接本机的IP

手机 -> 设置 -> WIFI -> 点击你连的WIFI最右边的感叹号 -> 页面滑到底部 -> HTTP代理 -> 手动.

> 需要填写两项.
> 1.服务器:(为第一步获取的本机IP地址)
> 2.端口:(一般为8888)

![2](https://upload-images.jianshu.io/upload_images/1452166-ab2ae38e84ea98d5.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.Charles上的设置

Charles -> 工具栏 -> Proxy -> Proxy Setting

> 1.将Port设置为:8888 (此处应与手机上填写的端口号保持一致)
> 2.勾选 `Enable Transparent HTTP Proxying`
> 3.此时就已经设置好了.如果这台手机是第一次连接本机.此时Charles就会弹出一个警示框.选择`Allow`即可.

![3](https://upload-images.jianshu.io/upload_images/1452166-ebb52930feb77ad2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 二.拦截HTTPS方法:

1.证书的安装

如果你拦截的请求为HTTPS.那么Charles是不能拦截的.会出现接口显示Unknown的情况.这是因为没有安装Charles证书的原因.

> 注意: 真机和模拟器都需要安装这个证书.而且不同的模拟器都是独立的.所以各自都需要安装一次.

> 安装方法: 真机或者模拟器打开Safari(必须是Safari).输入网址`www.charlesproxy.com/getssl`安装即可. 

2.Charles设置

Charles -> 工具栏 -> Proxy-SSL Proxying Settings.

> 证书安装后.Charles默认也并不截取Https.所以还要设置一下.如图设置即可.

![5](https://upload-images.jianshu.io/upload_images/1452166-3ca96bbc76efb7f3.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![6](https://upload-images.jianshu.io/upload_images/1452166-4cd5bc5e4491effb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 三.Maplocal修改返回数据

开发时需要测试某个数据为临界值时.app显示是否会正常.

1.保存接口返回的数据到本地文件

>  找到你想修改的url -> 右击 -> Save Response -> 填写文件名(如response.text)
    
2.将接口与本地数据建立链接

> 找到刚才的url -> 右击-map local -> 粘贴刚才复制的url到Host
> Protocol / Host / Port / Path都会自动填充.
> 我们只要把Query里的数据删除即可(必须删除).点击OK就可以了.

3.打开刚才你保存在本地的文件response.text.修改你想修改的数据.`Alt+s`保存一下.

4.这时候app再请求这个接口的时候.返回的数据就是你修改的本地数据了.

![7](https://upload-images.jianshu.io/upload_images/1452166-61af0ba86506bdb7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 四.rewrite修改http返回码

有时候我们需要模拟接口访问失败的情况.就要修改Http返回码.

1.获取你想修改的接口的URL

> 在Charles里找到你想修改的url -> 右击该url -> Copy URL
> 即可获取该url.如图.

![7](https://upload-images.jianshu.io/upload_images/1452166-270207dee8be5474.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

2.打开Rewrite功能

> 打开Charles -> 工具栏 -> Tools -> Rewrite

![8](https://upload-images.jianshu.io/upload_images/1452166-80e75a7c0a6aa6d0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.设置选项

3.1.勾选Enable Rewrite.

3.2.勾选Debug in Error log

![9](https://upload-images.jianshu.io/upload_images/1452166-ba75e7d873242150.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

3.3.点击Locations里`Add`按钮(上图5)

![10](https://upload-images.jianshu.io/upload_images/1452166-44522ff1fbfa8dd1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

> Protocol设置为Http或者Https(视你的接口而定)
> Host: 为你刚才复制的Url的Host.
> Path: 为你刚才复制的Url的path
> Port 和 Query 都留空.(一定要留空)
        
> 注释:什么是Host 和 Path
> 如该接口: https://www.baidu.com/x/v2/show?platform=ios
> `www.baidu.com`就为Host.
> `/x/v2/show`即为Path(`?`之前`Host`之后即为Path)

(5).点击Rules里的`Add`按钮(上图6)

> Type 选项选择 `Response Status`
> Match 栏里的 `Value`填写 `200`
> Replace 栏里的 `Value`填写 你想修改成的返回码.如`404`

![11](https://upload-images.jianshu.io/upload_images/1452166-3a3d9c9f5b0c6dba.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 五.Mocky用法: 

[Mocky](http://www.mocky.io/)是一个可以自己生成一个Api.并且可以自定义Status Code. Body的网站.

![12](https://upload-images.jianshu.io/upload_images/1452166-8a155afbb907f9ec.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## 六.HTTP返回码总结

| 状态码 | 类别  | 原因 |
| --- | --- | --- |
| 1xx | information-信息状态码  | 接收的请求正在处理  |
| 2xx | success-成功状态码 | 请求正常处理完毕 |
| 3xx | redireaction-重定向状态码 | 每次请求中使用重定向不要超过5次 |
| 4xx | client error-客户端错误状态码 | 表示请求可能出错,服务器无法处理请求 |
| 5xx | server error-服务器错误状态码 | 服务器本身的错误,而不是请求出错 |

> 1.关于304的用处见[利用服务端304返回码更新本地资源](http://www.jianshu.com/p/0547ac1b2b08)

## 七.模拟慢网速

在开发的时候.有时需要测试在网速差的时候app是否正常.

> 1.Charles工具栏-Proxy-Throttle Setting
> 2.选中`Enable Throttling`
> 3.选择Throttle preset为`56 kbps Modem`.他就会自动将Bandwidth设置为57.6kb/s.这个即你现在的下载速度.如果你觉得还不够慢.可以将他修改的更小.

![13](https://upload-images.jianshu.io/upload_images/1452166-3de181169abce027.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


## 八: Charles抓不到包的处理方法总结

> 报错:SSLHandshake: Received fatal alert: unknown_ca

##### 1.检查模拟器是否装了chales证书.

安装地址: www.charlesproxy.com/getssl
使用safari(必须系统自带浏览器)打开这个网址.并安装证书.

##### 2.检查手机是否勾选chals证书:

设置路径: 手机 -> 设置 -> 通用 -> 关于本机 -> 证书信任设置(拉到底) -> 勾选Charles Proxy CA

![14](https://upload-images.jianshu.io/upload_images/1452166-cc4378c4bbcecbec.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


##### 3.检查手机是否信任charles证书

设置路径: 手机 -> 设置 -> 通用 -> 描述文件与设备管理(拉到底)  -> 信任charles 证书

##### 4.检查你是否开了VPN(翻墙软件)

翻墙软件会修改你的网路配置
关闭VPN重新打开charles即可.

![15](https://upload-images.jianshu.io/upload_images/1452166-79d17b3e2be6772f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



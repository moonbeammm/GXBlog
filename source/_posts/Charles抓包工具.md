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

| 状态码 | 英文名称 | 说明 |
| --- | --- | --- |
| 100 | continue | 客户端必须继续发出请求  |
| 101 | switching protocols | 客户端要求服务器根据请求转换http协议版本 |
| 200 | ok | 请求成功 |
| 201 | created | 服务器已经创建了文档,location头给出了他的url |
| 202 | accepted | 接收和处理,但处理还未完成 |
| 203 | non-authoriative information | 返回信息不确定或不完整 |
| 204 | no content | 服务器成功处理了请求,但没有返回任何内容  |
| 205 | reset content | 服务器完成了请求,用户代理必须复位当前已经浏览过的文件  |
| 206 | partial content | 服务器已经完成了部分用户的get请求 |
| 300 | multiple choices | 请求的资源可在多处得到 |
| 301 | moved permanently | 删除请求数据 |
| 302 | found | 在其他地址发现了请求数据 |
| 303 | see other | 建议客户端访问其他url或换成其他访问方式 |
| 304 | not modified | 客户端请求成功.但文件未变化 |
| 305 | use proxy | 请求的资源必须从服务器指定的地址得到 |
| 307 | temporary redirect | 申明请求的资源临时性删除 |
| 400 | not found | 客户端请求的语法错误,服务器无法解析 |
| 401 | unauthorized | 请求授权失败 |
| 402 | payment granted | 保留有效的charge to头响应 |
| 403 | forbidden | 请求不允许 |
| 404 | not found | 服务器无法根据客户端的请求找到资源 |
| 405 | method not allowed | 用户在request-line字段定义的方法不允许 |
| 406 | not acceptable | 根据用户发送的accept.请求资源不可访问 |
| 407 | proxy authentication required | 类型401,用户必须首先在代理服务器上得到授权 |
| 408 | request time out | 客户端没有在用户指定的时间内完成请求 |
| 409 | conflict | 对当前资源状态,请求不能完成 |
| 410 | gone | 服务器上不再有此资源且无进一步的参考地址 |
| 411 | length required | 服务器拒绝用户自定义的content-length属性请求 |
| 412 | precondition failed | 一个或多个请求头字段在当前请求中错误 |
| 413 | request entity too large | 请求的资源大于服务器允许的大小 |
| 414 | request-url too large | 请求的资源url鲳鱼服务器允许的长度 |
| 415 | unsupported media type | 请求资源不支持请求项目的格式 |
| 416 | requested range not satisfiable | 请求中包含range请求头字段,在当前请求资源范围内没有range指示值,请求也不包含if-range请求头字段 |
| 417 | expectation failed | 服务器不满足请求expect头字段指定的期望值,如果是代理服务器,可能是下一级服务器不能满足请求 |
| 500 | internal server error | 服务器内部错误,无法完成请求 |
| 501 | not implemented | 服务器不支持请求的函数 |
| 502 | bad geteway | 服务器暂时不可用,有时是为了防止发生系统过载 |
| 503 | service unavailable | 服务器过载或暂停维修 |
| 504 | geteway timeout | 关口过载,服务器使用另一个关口或服务来响应用户,等待时间设定值较长 |
| 505 | http version not supported | 服务器不支持或拒绝支持请求头中指定的http版本 |

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



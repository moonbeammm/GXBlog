---
title: Git-Merge
tags:
    - Git
---

# 一.前言

![image.png](https://upload-images.jianshu.io/upload_images/1452166-2786b47c14e6d1be.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

如上图.我现在要在develop上把feature/test分支merge进来.
但是此时进行merge操作会产生两种节点状态.

<!--more-->

## 状态一.Fast Forward Merge

![image.png](https://upload-images.jianshu.io/upload_images/1452166-89443268e980d8ad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

直接使用merge命令
这样并不会产生新的commit节点.而是真的直接合并了两个分支.
仿佛他们是一个分支一样.如下图

![image.png](https://upload-images.jianshu.io/upload_images/1452166-4d56d0f1e05c6b10.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

## 状态二.加入—no-ff参数

![image.png](https://upload-images.jianshu.io/upload_images/1452166-805de1a766d6b8ad.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

但是如果在merge命令后面加上—no-ff参数.
git就会产生一个新的merge节点.如下图.

![image.png](https://upload-images.jianshu.io/upload_images/1452166-d59699f53fc04147.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

# 二.总结

如果不加上—no-ff这个参数.
在以后查看commit信息的时候会产生一定的困难.

## 困难一: 查询困难

以后查看merge的某个分支的时候.
不知道被merge的那个分支是从哪个commit开始的.

## 困难二: 以后revert操作困难

如果总包的时候.老板说某个需求不上了.
如果不加—no-ff参数
那你revert的时候就要一个一个commit去revert
而如果加上了—no-ff参数.
你就只需要revert那一个merge节点就可以了.

所以还是最好加上—no-ff参数.



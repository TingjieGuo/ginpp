---
weight: 2
title: "- Pirana"
---

<!-- <font style="font-size:2em">Pirana</font>   -->
# Pirana
## 1. 介绍
Pirana是一款适配NONMEM及PsN使用的GUI程序，其主要功能是提供可视化交互，大大提升了NONMEM及PsN的使用体验。Pirana最初由荷兰人Ron Keizer开发，同时支持Windows、macOS和Linux平台，同时也有基于浏览器的PiranaJS版本。Pirana于2018年被[Certara公司收购](https://www.certara.com/pressrelease/certara-acquires-pirana-a-leading-pharmacometrics-modeling-workbench/)，目前Windows版仍在持续开发维护，在macOS和Linux平台上的历史版本已不再可用。

你可以在此[联系Certara](https://www.certara.com/software/pirana-modeling-workbench/)获取Pirana的授权，学术界授权免费。

## 2. 安装及设置
Pirana的安装非常简单，按提示操作即可。通常情况下Pirana在安装后无需配置就可以直接使用，但可能出现的情况是Pirana无法识别NONMEM和PsN，这时就需要手动设置一下。

首先是将Pirana与NONMEM关联，选择File\Settings\NONMEM，如下图所示。点击Local NONMEM installations栏目右上角的搜索按钮，让Pirana自动搜索或手动指定NONMEM的安装路径。

{{< figure src="/docs/tools/img/pirana1.png" caption="" width=450 >}}

然后继续在Pirana seetings窗口中左侧找到PsN选项，修改psn.conf location。在Windows系统下，除非另外指定，否则**psn.conf**文件通常保存在perl的安装目录下，具体的路径为：

```
Your_Perl_Address\site\lib\PsN_X_X_X\psn.conf
```

在settings左侧还有许多其他的设置，其中Software integration比较有用，可以设置其他软件与Pirana的关联，这里建议将R、Code/text-editor与Pirana设置关联。至此，Pirana设置也全部完成。





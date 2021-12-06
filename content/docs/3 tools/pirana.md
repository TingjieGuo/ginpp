---
weight: 2
title: "- Pirana"
---

<font style="font-size:2em">Pirana</font>  

## 1. Pirana简介
{{< hint info >}}
**Under construction...**  
{{< /hint >}}

## 2. Pirana安装及设置
&emsp;&emsp;Pirana的安装就简单许多了，按提示操作即可，[点此进入](https://lp.certara.com/WFDownloadPirana.html)下载页面。这里主要说一下安装之后的配置，通常情况下在安装过后无需配置就可以直接使用了，但凡事都可能有例外。首先是将Pirana与NONMEM关联，选择File\Settings\NONMEM，如下图所示。点击Local NONMEM installations栏目右上角的搜索按钮，让Pirana自动搜索或手动指定NONMEM的安装路径。

<br />
{{< figure src="/img/pirana1.png" caption="" width=450 >}}
<br />

然后继续在Pirana seetings窗口中左侧找到PsN选项，修改psn.conf location。在Windows系统下，除非另外指定，否则psn.conf文件通常保存在perl的安装目录下，具体的路径为Your_Perl_Address\site\lib\PsN_X_X_X\psn.conf。

&emsp;&emsp;在settings左侧还有许多其他的设置，其中Software integration比较有用，可以设置其他软件与Pirana的关联，这里建议将R、Code/text-editor与Pirana设置关联。至此，Pirana设置也全部完成。





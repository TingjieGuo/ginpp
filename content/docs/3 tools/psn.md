---
weight: 1
title: "- Perl-Speaks-NONMEM"
---

<!-- <font style="font-size:2em">Perl-Speaks-NONMEM</font>   -->
# Perl-Speaks-NONMEM

## 1. 一般安装
&emsp;&emsp;在成功配置Perl环境后，我们就可以安装PsN了，[点此进入](https://uupharmacometrics.github.io/PsN/download.html)下载页面。下载后打开PsN的根目录（默认名为PsN-Source），启动文件为setup.pl，右键选择以管理员身份运行即开始安装。通常情况下此时是可以直接运行该文件的，但有时也会出现系统不识别该类型文件的情况，若之前已经测试过Perl成功安装的话，此时可以尝试命令行安装方式：以管理员身份打开`cmd`，进入PsN安装文件根目录`cd x:\..\PsN-Source`，输入命令：`perl setup.pl`。绝大多数情况下，这两种方法都可以成功启动安装。

&emsp;&emsp;在安装过程中，根据提示输入`y`或`n`，然后回车，多数情况下输入`y`。若之前在计算机上安装过PsN，可能会提示询问是否保留原有的**psn.conf**文件，建议输入`n`，让程序新建一个**psn.conf**，这个文件里记录了一些配置信息，包括NONMEM版本、路径以及计算模型时的选项。安装程序会自动搜索NONMEM所在的路径，并自动设置好**psn.conf**，但之前也发现如果NONMEM装在比较深的目录下，PsN安装程序可能搜索不到，需要手动输入NONMEM的安装路径。这样PsN就安装好了，比较容易。

## 2. 高级配置
{{% hint danger %}}
**Work in progress**  
{{% /hint %}}

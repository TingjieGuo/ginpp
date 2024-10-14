---
weight: 1
title: "- PsN"
---

<!-- <font style="font-size:2em">Perl-Speaks-NONMEM</font>   -->
# Perl-Speaks-NONMEM
## 1. Windows
PsN官方为Windows用户提供了预先配置好的下载包，安装相对简单，具体过程如下：

1. 在[PsN项目官网](https://uupharmacometrics.github.io/PsN/download.html)下载`PsN-5.4.0-windows-64bit.zip`并将其解压缩。
2. 更新系统环境变量，将`PsN-5.4.0\strawberry\perl\bin`添加至PATH变量中。
3. 在`PsN-5.4.0\strawberry\perl\site\lib\PsN_5_4_0\psn.conf`文件中的[nm_versions]设置中添加安装好的NONMEM根目录，例如`default=C:\nm751,7.5.1`。

上述安装过程以PsN 5.4.0版本为例，安装设置时注意修改为你所下载的版本号。

## 2. macOS

### 2.1 安装及配置Perl环境
#### 安装Perl
{{% hint warning %}}
macOS内置了Perl，但PsN并不总能安装成功，建议用Homebrew再装一次Perl。
{{% /hint %}}
我们使用Homebrew来安装Perl，打开`Terminal.app`并执行以下命令：
```zsh
brew install perl
```
安装结束后，输入以下命令测试Perl是否安装成功：
```zsh
perl -version
```
正常的话会得到类似下面的返回信息:

```
This is perl 5, version 38, subversion 2 (v5.38.2) built for darwin-thread-multi-2level

Copyright 1987-2023, Larry Wall

Perl may be copied only under the terms of either the Artistic License or the
GNU General Public License, which may be found in the Perl 5 source kit.

Complete documentation for Perl, including FAQ lists, should be found on
this system using "man perl" or "perldoc perl".  If you have access to the
Internet, point your browser at https://www.perl.org/, the Perl Home Page.
```

#### 安装Perl模块
PsN的功能依赖一些额外的Perl模块，我们需要事先把它们安装好。

打开`Terminal.app`，依次执行以下命令：
```zsh
sudo cpan Math::Random::Free
sudo cpan Math::MatrixReal
sudo cpan Mouse
sudo cpan MouseX::Params::Validate
sudo cpan Archive::Zip
sudo cpan YAML
sudo cpan Capture::Tiny
sudo cpan File::Copy::Recursive
sudo cpan File::HomeDir
sudo cpan Math::SigFigs
sudo cpan Statistics::Distributions
```
在此期间请保证网络连接状态，安装成功或失败会有明确的提示信息。

### 2.2 安装PsN
首先去[PsN项目官网](https://uupharmacometrics.github.io/PsN/download.html)下载PsN安装包，下载后打开解压该安装包，应该会得到一个名为`PsN-Source`的文件夹。

打开`Terminal.app`，执行以下命令：
```zsh
cd ~/Downloads/PsN-Source # 进入到PsN安装文件目录，可修改为你的实际目录
sudo perl setup.pl
```
接下来根据提示输入`y`或`n`，如果不确定的话可以一路选`y`。若之前在计算机上安装过PsN，可能会提示询问是否保留原有的**psn.conf**文件，建议输入`n`，让程序新建一个**psn.conf**，这个文件里记录了一些配置信息，包括NONMEM版本、路径以及计算模型时的选项。安装程序会自动搜索NONMEM所在的路径，并自动设置好**psn.conf**，但之前也发现如果NONMEM装在比较深的目录下，PsN安装程序可能搜索不到，需要手动输入NONMEM的安装路径。
<!-- ## 3. 进阶设置 -->


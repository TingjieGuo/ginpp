---
weight: 1
title: "- NONMEM的安装"
---
<!-- <font style="font-size:2em">NONMEM的安装</font> -->
# NONMEM的安装

<!-- 我在[这里](https://tingjieguo.com/posts/nmmac/)写了一个英文版的NONMEM在Mac上安装的非常简略的教程，会佛系完善并更新中文版... -->

## 1. NONMEM安装源文件
开始之前，我们简单认识一下NONMEM安装文件夹里的一些内容。

{{< figure src="/docs/nonmem/img/content.png" caption="NONMEM7.4.4根目录*nm744CD*中的内容" width=450 >}}

根目录下有许多文件名以**install**开头的文件，这些是我们安装NONMEM时需要直接运行的程序，不同文件对应不同的操作系统，对Windows而言，我们需要运行的是**SETUP74.bat**，如果是macOS, 我们需要运行的是**SETUP74**。**nonmem.lic**是NONMEM的授权文件，即使用许可，建议在安装NONMEM前先将授权文件拷贝至安装文件根目录下。**readme_XXX.pdf**是官方的说明文档。剩下的文件或文件夹中，除了前面已经说过的**compiler**文件夹外，其余的我们可以暂时先不管。

## 2. 安装NONMEM的命令
下面你可以根据你所使用的系统参考相应的安装步骤。

{{% tabs %}}

{{% tab "Windows" %}}
第一步要做的还是打开`cmd`，这里建议启动`cmd`时右键选择“以管理员身份运行”。以管理身份打开`cmd`之后，首先需要进入NONMEM安装文件的根目录，假设NONMEM安装源文件根目录位于C盘的nm744文件夹下，则输入命令：

```
cd c:\nm744CD
```
如果安装源文件根目录在D盘nm文件夹下，则输入：
```
cd d:\nm
```
接下来输入命令：
```
SETUP74 c:\nm744CD e:\nm744 gfortran
```
这条命令由四部份组成，首先是`SETUP74`，它表示要运行**SETUP74.bat**这个文件；接下来`c:\nm744CD`表示来源路径，即NONMEM安装文件根目录的地址，根据实际情况决定；然后`e:\nm744`表示目标路径，即安装NONMEM的位置，可以根据需求自定义；`gfortran`定义将要使用的Fortran编译器命令。这个命令其实省略了很多其他选项，完整的命令除上述四部份之外还有其他的参数选项，但这里只针对一般情况，其余选项一般不需要指定，细节可以参考**readme_XXX.pdf**文档。

{{% /tab %}}
{{% tab "MacOS" %}}
打开终端程序`Terminal.app`，首先需要进入NONMEM安装文件的根目录，假设NONMEM安装源文件根目录`nm744CD`位于用户Downloads文件夹下，输入命令：
```zsh
cd ~/Downloads/nm744CD
```
可以根据安装源文件所在位置修改上述命令，例如安装源文件在桌面nm文件夹下，则输入：
```zsh
cd ~/Desktop/nm
```
进入到NONMEM安装源文件根目录后，输入以下命令：
```zsh
sudo /bin/bash SETUP74 ~/Downloads/nm744CD /opt/nm744 gfortran
```
此时系统会提示输入你的账户密码（就是你的用户开机密码），注意此时屏幕上不会显示你所输入的内容，正常输入后按enter确认即可。

macOS的安装命令相对复杂，`sudo`命令会将其后面所接的命令以管理员的身份运行，这个命令并非100%必需，但是保险起见，建议带着；`/bin/bash`的意思是运行在`/bin`目录下的`bash`这个程序，从而执行其后所指定的文件， 即`SETUP74`这个文件， `SETUP74`这个文件是NONMEM的安装程序脚本；接下来`~/Downloads/nm744CD`表示NONMEM安装文件根目录的地址，其中`~`表示当前用户的根目录，即`/Users/你的用户名/`；然后`/opt/nm744`表示想要将NONMEM安装的目标路径，可以根据需要修改；`gfortran`定义将要使用的Fortran编译器命令。这条命令省略了很多其他选项，细节可以参考**readme_XXX.pdf**文档。
{{% /tab %}}
{{% /tabs %}}

{{% hint danger %}}
安装过程如果遇到系统提示“install”不是来自Apple认证的开发者，这说明macOS的安全机制被触发了，此时你需要先[关闭macOS“门禁”]({{< relref "/docs/env/mac/#3-关闭macos门禁" >}})
{{% /hint %}} 

执行成功后系统会提示类似下图的信息，最后一行的提示`Continue (y/n)? [y]`，直接enter确认即可。之后的过程就比较简单了，大多时间是在等待以及根据提示的默认选项按enter。

{{< figure src="/docs/nonmem/img/setup732.png" caption="" width=450 >}}

在进行到下图所示的一步时，在目标路径的根目录下可以找到**progress.txt**文件，这个文件里可以看到完成进度，每完成1%就在这个txt文件里写入一行。这一步是在编译源文件，比较花时间，这一步骤可以反映计算机CPU的性能。

{{< figure src="/docs/nonmem/img/setup735.png" caption="" width=450 >}}

安装的最后一步是测试，会提示`Do you want to test the installation?`，建议输入`y`测试安装是否成功。如果安装成功它会提示让你比较两个目标函数值，我看到的这个数字一直以来都是`104.561`，我猜你大概也是。至此，NONMEM安装就完成了。
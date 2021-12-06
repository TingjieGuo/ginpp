---
weight: 1
title: "NONMEM的安装"
---

<font style="font-size:2em">NONMEM的安装</font>

*我在这里写了一个英文版的NONMEM在Mac上安装的非常简略的教程(https://tingjieguo.com/posts/nmmac/)，会佛系完善并更新中文版...*

## 1. NONMEM安装源文件
&emsp;&emsp;在确认GCC安装成功后，我们就可以继续安装NONMEM了。NONMEM的安装看起来好像复杂一点，但只要按照步骤做，其实也不难。开始之前，我们需要认识NONMEM安装文件夹里的一些内容，如下图所示。

<br />
{{< figure src="/img/content.png" caption="NONMEM7.4.4根目录*nm744CD*中的内容" width=450 >}}
<br />

根目录下有许多文件名以*install*开头的文件，这些是我们安装NONMEM时需要直接运行的程序，不同文件对应不同的操作系统，对Windows而言，我们需要运行的是*SETUP74.bat*，这其实是一个批处理文件。*nonmem.lic*是NONMEM的授权文件，即使用许可，建议在安装NONMEM前先将授权文件拷贝至安装文件根目录下。*readme_730.pdf*是官方的说明文档。剩下的文件或文件夹中，除了前面已经说过的*compiler*文件夹外，其余的我们可以暂时先不管。

## 2. 安装NONMEM的命令
&emsp;&emsp;下面开始安装NONMEM，第一步要做的还是打开`cmd`，这里建议启动`cmd`时右键选择“以管理员身份运行”。以管理身份打开cmd之后，首先需要进入NONMEM安装文件的根目录，假设NONMEM安装源文件根目录位于C盘的nm744文件夹下，则输入命令：

    cd c:\nm744CD

如果安装源文件根目录在D盘nm文件夹下，则输入：

    cd d:\nm

接下来输入命令：

    SETUP74 c:\nm744CD e:\nm744 gfortran

这条命令由四部份组成，首先是`SETUP74`，它表示要运行*SETUP74.bat*这个文件；接下来`c:\nm730`表示来源路径，即NONMEM安装文件根目录的地址，根据实际情况决定；然后`e:\nm73`表示目标路径，即安装NONMEM的位置，同样根据实际情况而决定；`gfortran`表示编译器为GCC的GFortran，如果你是按照本教程一步一步来的话这里不用修改。注意以上四部份彼此之间都要用空格隔开。这个命令其实省略了很多其他选项，完整的命令除上述四部份之外还有其他的参数选项，但本教程只针对一般情况，其余选项一般不需要指定，如果你有兴趣了解可以参考*readme_730.pdf*文档。

<br />
{{< figure src="/img/setup732.png" caption="" width=450 >}}
<br />

如果运行成功则会如上图显示，最后一行的提示`Continue (y/n)? [y]`，直接回车即可。之后的过程就比较简单了，大多时间是在等待以及根据提示的默认选项按回车。

&emsp;&emsp;在进行到下图所示的一步时，在目标路径的根目录下可以找到*progress.txt*文件，这个文件里可以看到完成进度，每完成1%就在这个txt文件里写入一行。这一步是在编译源文件，比较花时间，这一步骤可以反映计算机CPU的性能。

<br />
{{< figure src="/img/setup735.png" caption="" width=450 >}}
<br />

安装的最后一步是测试，会提示`Do you want to test the installation?`，建议输入`y`测试安装是否成功。如果安装成功它会提示让你比较两个目标函数值，我看到的这个数字一直以来都是`104.561`，我猜你大概也是。至此，NONMEM安装就全部结束了。
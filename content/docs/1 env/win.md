---
weight: 1
title: "- Windows环境配置"
---
<font style="font-size:2em">Windows操作系统的环境配置</font>  

## 1. 安装Fortran编译器
&emsp;&emsp;所谓编译器，是指将高级语言翻译成计算机可直接解读和运行的“低级语言”。顾名思义，Fortran编译器是用来编译Fortran语言的程序。目前有许多不同版本的Fortran编译器，我个人比较推荐使用GCC，GCC是GNU Compiler Collection的缩写，它是由GNU计划推出的GNU编译器套件，其中编译Fortran的子程序名字叫GFortran。GCC是针对Linux和Unix系统开发的，而且每次的更新都只发布源代码，想要使用的话还需要经过编译，不过也无须担心，国外有很多组织发布了经过编译的版本，且适用于Windows系统。NONMEM 7.3的安装包里也附带GCC安装程序，版本为4.6.0，建议初学者直接使用。安装过程非常简单，按提示操作即可。

<br />
{{< figure src="/img/content.png" caption="NONMEM7.4.4自带的GCC默认路径为nm744CD/compilers/" width=450 >}}
<br />

&emsp;&emsp;安装结束后，可以检查一下GCC安装是否正确。从Windows的开始菜单中启动命令提示行`cmd`，输入命令：`gfortran -v`，注意空格。如果安装正确的话会出现类似下面的返回信息。

    ~ ❯ gfortran -v
    Using built-in specs.
    COLLECT_GCC=gfortran
    COLLECT_LTO_WRAPPER=/usr/local/gfortran/libexec/gcc/x86_64-apple-darwin16/6.3.0/lto-wrapper
    Target: x86_64-apple-darwin16
    Configured with: ../gcc-6.3.0/configure --prefix=/usr/local/gfortran --enable-languages=c,c++,fortran,objc,obj-c++ --build=x86_64-apple-darwin16 --with-gmp=/Users/fx/devel/gcc/deps-static/x86_64 --with-mpfr=/Users/fx/devel/gcc/deps-static/x86_64 --with-mpc=/Users/fx/devel/gcc/deps-static/x86_64 --with-isl=/Users/fx/devel/gcc/deps-static/x86_64
    Thread model: posix
    gcc version 6.3.0 (GCC)

最后一行`gcc version`后面的数字表示GCC的版本号，这里显示GCC版本为6.3.0，NONMEM直到7.4.4版本自带的GCC版本均为4.6.0。需要注意的是，由于NONMEM在安装过程中需要使用gfortran编译源文件，之后尽量不要再更换GCC版本，GCC可能会不兼容不同版本GCC编译的程序。


## 2. 配置Perl环境
### 2.1 安装Perl解释器
&emsp;&emsp;Perl常见的有ActiveState Perl和Strawberry Perl两大发行版，两个版本主要的使用区别是模块管理不同，但都不是很难。我过去使用ActiveState Perl比较多，它在Windows系统下使用ppm工具来管理Perl模块，但ppm的资源库在中国没有镜像，网络质量差的情况下容易出错；Strawberry Perl保持了Linux下的风格，采用cpan管理Perl模块，cpan在全球有丰富的镜像，在中国大陆也有10多个镜像，使用体验会好很多，但缺点是某些模块管理不够高效，忽略网络质量的情况下不如ppm快。刚刚发现PsN网站上推荐的是Strawberry Perl，但我接下来内容还是以ActiveState Perl为例，Strawberry Perl相关模块的安装可以参考[mac OS系统环境配置]({{< relref "/docs/1 env/mac" >}})。

&emsp;&emsp;Perl也有许多版本，PsN官方要求Perl版本不低于5.10.1，[点此打开](https://www.activestate.com/products/perl/downloads/)ActiveState Perl官方下载地址。Perl的安装同样也很简单，下载之后按提示操作即可。安装好Perl之后，我们也可以测试一下安装是否成功，打开`cmd`，输入命令：`perl -v`，如果成功的话会显示类似下面的返回信息:

    ~ ❯ perl -v

    This is perl 5, version 18, subversion 4 (v5.18.4) built for darwin-thread-multi-2level
    (with 2 registered patches, see perl -V for more detail)

    Copyright 1987-2013, Larry Wall

    Perl may be copied only under the terms of either the Artistic License or the
    GNU General Public License, which may be found in the Perl 5 source kit.

    Complete documentation for Perl, including FAQ lists, should be found on
    this system using "man perl" or "perldoc perl".  If you have access to the
    Internet, point your browser at http://www.perl.org/, the Perl Home Page.

第一行标注了Perl的版本，我这里显示但是`This is perl 5，version 18`。

### 2.2 安装Perl模块
我们还需要再额外安装一些Perl的模块，PsN的某些功能需要调用这些模块。以管理员身份打开`cmd`，依次输入以下命令：

    ppm install Math-Random
    ppm install MooseX-Params-Validate
    ppm install Statistics-Distributions
    ppm install YAML-XS
    ppm install XML-LibXML

在此期间请保证网络连接状态，安装成功或失败会有明显的提示信息。
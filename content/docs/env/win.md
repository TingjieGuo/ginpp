---
weight: 1
title: "- Windows环境配置"
---
<!-- <font style="font-size:2em">Windows操作系统的环境配置</font> -->

# Windows操作系统的环境配置

## 1. 安装Fortran编译器
所谓编译器，是指将高级语言翻译成计算机可直接解读和运行的“低级语言”。顾名思义，Fortran编译器是用来编译Fortran语言的程序。目前有许多不同版本的Fortran编译器，我个人比较推荐使用GCC，GCC是GNU Compiler Collection的缩写，它是由GNU计划推出的GNU编译器套件，其中编译Fortran的子程序名字叫GFortran。GCC是针对Linux和Unix系统开发的，而且每次的更新都只发布源代码，想要使用的话还需要经过编译，不过也无须担心，国外有很多组织发布了经过编译的版本，且适用于Windows系统。NONMEM 7.3的安装包里也附带GCC安装程序，版本为4.6.0，建议初学者直接使用。安装过程非常简单，按提示操作即可。

{{< figure src="/docs/nonmem/img/content.png" caption="NONMEM7.4.4自带的GCC默认路径为nm744CD/compilers/" width=450 >}}

安装结束后，可以检查一下GCC安装是否正确。从Windows的开始菜单中启动命令提示行`cmd`，输入命令：`gfortran -v`，注意空格。如果安装正确的话会出现类似下面的返回信息。

```dos
~ ❯ gfortran -v
Using built-in specs.
COLLECT_GCC=gfortran
COLLECT_LTO_WRAPPER=/usr/local/gfortran/libexec/gcc/x86_64-apple-darwin16/6.3.0/lto-wrapper
Target: x86_64-apple-darwin16
Configured with: ../gcc-6.3.0/configure --prefix=/usr/local/gfortran --enable-languages=c,c++,fortran,objc,obj-c++ --build=x86_64-apple-darwin16 --with-gmp=/Users/fx/devel/gcc/deps-static/x86_64 --with-mpfr=/Users/fx/devel/gcc/deps-static/x86_64 --with-mpc=/Users/fx/devel/gcc/deps-static/x86_64 --with-isl=/Users/fx/devel/gcc/deps-static/x86_64
Thread model: posix
gcc version 6.3.0 (GCC)
```

最后一行`gcc version`后面的数字表示GCC的版本号，这里显示GCC版本为6.3.0，NONMEM直到7.4.4版本自带的GCC版本均为4.6.0。需要注意的是，由于NONMEM在安装过程中需要使用gfortran编译源文件，之后尽量不要再更换GCC版本，GCC可能会不兼容不同版本GCC编译的程序。
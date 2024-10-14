---
weight: 1
title: "- Windows环境配置"
---
<!-- <font style="font-size:2em">Windows操作系统的环境配置</font> -->

# Windows操作系统的环境配置

## 1. 安装Fortran编译器
所谓编译器，是指将高级语言翻译成计算机可直接解读和运行的“低级语言”。顾名思义，Fortran编译器是用来编译Fortran语言的程序。Fortran编译器有许多选择，我个人比较推荐使用GCC，GCC是GNU Compiler Collection的缩写，它是由GNU计划推出的GNU编译器套件，其中编译Fortran的子程序名字叫GFortran。NONMEM在7.5版本之前安装包里会附带GCC 4.6.0的安装程序，可以直接直接使用。

{{< figure src="/docs/nonmem/img/content.png" caption="NONMEM7.4.4自带的GCC默认路径为nm744CD/compilers/" width=450 >}}

NONMEM从7.5版本开始不再附带GCC，可以从NONMEM官方存档`https://nonmem.iconplc.com/#/compilers`（此链接需手动复制粘贴到浏览器地址栏中）中下载`gfortran-windows-460.exe`。

安装过程很容易，按提示操作即可。安装结束后，`gcc`和`gfortran`这两个命令会自动添加到系统的环境变量中，我们在`cmd`中输入以下命令来确认GCC安装正确：

```cmd
gfortran -v
````
返回信息应与以下类似：
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
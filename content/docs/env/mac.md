---
weight: 2
title: "- macOS环境配置"
---
<!-- <font style="font-size:2em">macOS操作系统的环境配置</font>   -->
{{% hint warning %}}
此教程不适用macOS 10.14（Mojave）及之前的版本。  
{{% /hint %}}
# macOS操作系统的环境配置
## 1. 安装macOS开发者工具
### 1.1 Xcode Command Line Tools
Xcode Command Line Tools（简称CLT）是macOS的开发工具集，这其中的大部分工具我们都不会使用到，但却是成功配置NONMEM所必需的。macOS通常并不会预装CLT，因此我们需要手动安装它。你可以从[Apple开发者网站](https://developer.apple.com/download/)上下载CLT的安装包然后再进行本地安装，但我更推荐下面这种使用命令行的方式。

在应用列表中打开终端程序`Terminal.app`，输入下列命令：

```zsh    
xcode-select --install
```

此时系统应该会如图提示安装CLT, 选择Install安装即可。

{{< figure src="/docs/env/img/clt.png" caption="" width=450 >}}

安装过程结束之后，建议使用以下命令来确认CLT的是否成功安装：

```zsh
xcode-select -p
```

如果CLT安装成功的话，终端返回内容应该与下面相同或类似：

```
/Library/Developer/CommandLineTools
```

### 1.2 Homebrew
CLT虽然已经包含了很多开发工具，但我们的核心需求Fortran编译器并不在CLT工具集中，因此我们我们还需要单独安装Fortran编译器，这里我非常推荐使用[Homebrew](https://brew.sh/)。Homebrew是为macOS及Linux系统开发的工具包管理程序，它里面包含了开源社区维护的各类工具，而且是已经编译好的可执行程序，大大降低了我们安装和维护各类工具的门槛。后面我们会使用到Homebrew安装GFortran和Perl。

同样地，我们在`Terminal.app`中执行以下命令，Homebrew就会自动安装好：

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 2. 安装Fortran编译器
NONMEM兼容的Fortran编译器只有GNU Fortran（GFortran）和Intel Fortran，前者开源。因此我们这里将使用Homebrew安装GFortran。GFortran有多个版本，但并非所有版本都能成功运行NONMEM，特别是在ARM架构的Mac电脑上，GFortran的最高版本不能超过11。截至2024年10月，以下配置已测试成功。
|             设备                    | macOS 版本    | GFortran 版本       | NONMEM 版本     |
|:-----------------------------------:|:------------:|:------------------:|:--------------:|
| Macbook Pro (13-inch, M1, 2020)     |   Big Sur    |     10.2 (x86)     |     7.5.1      |
| Macbook Pro (13-inch, M1, 2020)     |   Monterey   |     11.3 (ARM)     |     7.5.1      |
| Macbook Pro (13-inch, M1, 2020)     |   Ventura    |     11.5 (ARM)     |     7.5.1      |
| Macbook Pro (14-inch, M3 Pro, 2023) |   Sonoma     |     11.3 (x86)     |     7.5.1      |
| Macbook Pro (14-inch, M3 Pro, 2023) |   Sequoia    |     11.5 (ARM)     |     7.5.1      |

我们可以在`Terminal.app`中执行以下命令，指定Homebrew安装GFortran 11：
```zsh
brew install gcc@11
```
Homebrew会自动下载与当前macOS版本所对应的GCC工具包，其中包含我们需要的GFortran。

安装后GCC的命令集会自动添加到系统的环境变量里，包括我们需要的`gcc-11`和`gfortran-11`。为了确认安装成功，我们可以在`Terminal.app`中使用如下命令：
```zsh
gfortran-11 -v
```
这里你也可以使用`gcc-11 -v`。如果一切正常的话你应该会看到类似下面的返回信息：
```
Using built-in specs.
COLLECT_GCC=gfortran
COLLECT_LTO_WRAPPER=/opt/homebrew/Cellar/gcc@11/11.5.0/bin/../libexec/gcc/aarch64-apple-darwin22/11/lto-wrapper
Target: aarch64-apple-darwin22
Configured with: ../configure --prefix=/opt/homebrew/opt/gcc@11 --libdir=/opt/homebrew/opt/gcc@11/lib/gcc/11 --disable-nls --enable-checking=release --with-gcc-major-version-only --enable-languages=c,c++,objc,obj-c++,fortran --program-suffix=-11 --with-gmp=/opt/homebrew/opt/gmp --with-mpfr=/opt/homebrew/opt/mpfr --with-mpc=/opt/homebrew/opt/libmpc --with-isl=/opt/homebrew/opt/isl --with-zstd=/opt/homebrew/opt/zstd --with-pkgversion='Homebrew GCC 11.5.0' --with-bugurl=https://github.com/Homebrew/homebrew-core/issues --build=aarch64-apple-darwin22 --with-system-zlib --with-sysroot=/Library/Developer/CommandLineTools/SDKs/MacOSX13.sdk --with-ld=/Library/Developer/CommandLineTools/usr/bin/ld-classic
Thread model: posix
Supported LTO compression algorithms: zlib zstd
gcc version 11.5.0 (Homebrew GCC 11.5.0)
```

安装NONMEM需要`gcc-11`和`gfortran-11`这两个工具对代码进行编译，但NONMEM只能接受名为`gcc`和`gfortran`的命令（理论上可以改，但不太容易），所以我们仍然需要设置环境变量，手动将`gcc`和`gfortran`这两个命令指向`gcc-11`和`gfortran-11`。这里提供两种方法：

{{% tabs %}}

{{% tab "命令别名" %}}
顾名思义，这个方法的原理是给`gcc-11`和`gfortran-11`添加别名，让我们在使用`gcc`和`gfortran`命令时其实是在调用`gcc-11`和`gfortran-11`。

打开`Terminal.app`，输入以下命令：
```zsh
echo 'alias gcc="gcc-11"' >> ~/.zprofile
echo 'alias gfortran="gfortran-11"' >> ~/.zprofile
```
然后重启`Terminal.app`，输入以下命令来确认设置是否成功：
```zsh
which gcc
which gfortran
```
如果成功的话，返回内容应与下面类似:
```zsh
gcc: aliased to gcc-11
gfortran: aliased to gfortran-11
```
{{% /tab %}}
{{% tab "软链接" %}} 
软链接本质类似于创建快捷方式，我们可以给`gcc-11`和`gfortran-11`这两个命令创建名为`gcc`和`gfortran`软链接从而实现执行后二者命令时执行`gcc-11`和`gfortran-11`。

打开`Terminal.app`，输入以下命令：
```zsh
sudo ln -s $(which gcc-11) /usr/local/bin/gcc
sudo ln -s $(which gfortran-11) /usr/local/bin/gfortran
```
`sudo`命令会将其后面所接的命令以管理员的身份运行，此时系统会提示输入你的账户密码（即当前用户登录密码），注意此时屏幕上不会显示你所输入的内容，正常输入后按enter确认即可。

接下来输入以下命令来确认设置是否成功：
```zsh
which gcc
which gfortran
```
返回内容应与下面一致:
```zsh
/usr/local/bin/gcc
/usr/local/bin/gfortran
```
{{% /tab %}}
{{% /tabs %}}

以上方法二选其一即可，至此NONMEM安装所需要的所有系统设置就都已经完成了。

## 3. 关闭macOS“门禁”
macOS有一套叫作“门禁”（Gatekeeper）的安全系统，用来检查用户想要运行的程序是否属于Apple认证的开发者。由于NONMEM安装程序未经过Apple认证，“门禁”系统会在NONMEM安装过程中触发，导致安装失败。我们接下来可以临时关闭这套系统。

打开`Terminal.app`，输入以下命令：
```zsh
sudo spctl --global-disable
```
然后打开macOS的系统设置菜单，找到隐私与安全选项，其中“安全”选项下面有一项“Allow applications downloaded from”的设置，如下图所示：

{{< figure src="/docs/env/img/gatekeeper.png" caption="最后一项“Anywhere”在关闭“门禁”后才会显示" width=450 >}}

在执行过上面的命令后，此时应该会看到系统已经选择了“Anywhere”，这样后面安装NONMEM就不会出现问题了。完成NONMEM安装之后，我们可以回到这里，选择“App Store and identified developers”，或者可以使用以下命令再开启“门禁”系统：
```zsh
sudo spctl --global-enable
```



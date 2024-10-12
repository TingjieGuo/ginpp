---
weight: 2
title: "- macOS环境配置"
---
<!-- <font style="font-size:2em">macOS操作系统的环境配置</font>   -->
{{% hint danger %}}
**Work in progress**  
{{% /hint %}}
# macOS操作系统的环境配置
## 1. Apple开发者工具
### 1.1 Xcode Command Line Tools
Xcode Command Line Tools（简称CLT）是macOS的开发工具集，这其中的大部分工具我们都不会使用到，但却是成功配置NONMEM所必需的。macOS通常并不会预装CLT，因此我们需要手动安装它。你可以从[Apple开发者网站](https://developer.apple.com/download/)上下载CLT的安装包然后再进行本地安装，但我更推荐下面这种使用命令行的方式。

在应用列表中打开终端程序`Terminal.app`，输入下列命令：
    
    xcode-select --install

此时系统应该会如图提示安装CLT

<br />
{{< figure src="/img/install-Xcode-CLT.png" caption="选择Install安装即可" width=450 >}}
<br />

安装过程结束之后，建议使用以下命令来确认CLT的是否成功安装：

    xcode-select -p

如果CLT安装成功的话，终端返回内容应该与下面相同或类似：

    /Library/Developer/CommandLineTools

### 1.2 安装Homebrew
CLT虽然已经包含了很多开发工具，但我们的核心需求Fortran编译器并不在CLT工具集中，因此我们我们还需要单独安装Fortran编译器，这里我非常推荐使用[Homebrew](https://brew.sh/)。Homebrew是为macOS及Linux系统开发的工具包管理程序，它里面包含了开源社区维护的各类工具，而且是已经编译好的可执行程序，大大降低了我们安装和维护各类工具的门槛。后面我们会使用到Homebrew安装GFortran和Perl。

同样地，我们在`Terminal.app`中输入以下命令：

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

执行这条命令之后Homebrew就会自动安装好。

## 2. Fortran编译器安装及设置

## 3. Perl安装及设置
### 3.1 安装Perl解释器
### 3.2 安装Perl模块

*截至2024年10月，以下配置已测试成功
|             设备                    | macOS 版本    | GFortran 版本       | NONMEM 版本     |
|:-----------------------------------:|:------------:|:------------------:|:--------------:|
| Macbook Pro (13-inch, M1, 2020)     |   Big Sur    |     10.2 (x86)     |     7.5.1      |
| Macbook Pro (13-inch, M1, 2020)     |   Monterey   |     11.3 (ARM)     |     7.5.1      |
| Macbook Pro (13-inch, M1, 2020)     |   Ventura    |     11.5 (ARM)     |     7.5.1      |
| Macbook Pro (14-inch, M3 Pro, 2023) |   Sonoma     |     11.3 (x86)     |     7.5.1      |
| Macbook Pro (14-inch, M3 Pro, 2023) |   Sequoia    |     11.5 (ARM)     |     7.5.1      |

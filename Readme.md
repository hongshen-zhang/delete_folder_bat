# [文件夹批删除bat文件](https://github.com/hongshen-zhang/delete_folder_bat)
![System](https://img.shields.io/badge/System-Windows-green.svg)

Windows系统下，简单的文件夹批处理bat程序。作用为删除指定多个文件夹中的所有文件以及文件夹，但保留最大的空文件夹。
---

# 1 系统简介

该文件夹批删除文件为一个小工具，作用为删除指定多个文件夹中的所有文件以及文件夹，但保留最大的空文件夹，方便后续继续存储新文件。

常用于删除微信多余的聊天图片，视频等。

# 2 快速上手

通过编辑打开bat文件，修改以下文件名与文件数量，保存，重新运行bat即可。

```
:: 增加删除文件请修改该参数取值
SET Obj_Length=3
 
:: 增加删除文件请按照如下格式增加文件名
SET Obj[0].Name= 文档1
SET Obj[0].Value= "D:\soma3"
 
SET Obj[1].Name= 文档2
SET Obj[1].Value= "D:\Qingfeng"

SET Obj[2].Name= 文档3
SET Obj[2].Value= "D:\IQIYI Video"
```
# 3 运行结果

运行结果.png

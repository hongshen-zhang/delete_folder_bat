# [ObjectLogger](https://github.com/hongshen-zhang/delete_folder_bat)
![System](https://img.shields.io/badge/System-Windows-green.svg)

Windows系统下，简单的文件批处理bat程序，作用为删除指定多个文件夹中的所有文件以及文件夹，但保留最大的空文件夹。
---

[English Introduction](./README.md)

---

# 1 系统简介

ObjectLogger是一套强大且易用的对象日志记录系统。它能够将任意对象的变动日志记录下来，并支持查询。可以应用在用户操作日志记录、对象属性变更记录等诸多场景中。

<div align=center>
  <img width="90%" src="./pic/react_en.png"/>
</div>

该系统具有以下特点：

- 一站整合：系统支持日志的记录与查询，开发者只需再开发前端界面即可使用。
- 完全独立：与业务系统无耦合，可插拔使用，不影响主业务流程。
- 应用共享：系统可以同时供多个业务系统使用，互不影响。
- 简单易用：服务端直接jar包启动；业务系统有官方Maven插件支持。
- 自动解析：能自动解析对象的属性变化，并支持富文本的前后对比。
- 便于扩展：支持自定义对象变动说明、属性变动说明。支持更多对象属性类型的扩展。

整个项目包含四个部分：

- ObjectLoggerClient：能够集成到业务系统进行日志分析、发送jar包。可以从Maven官方仓库引入该jar包。该模块位于`client`子包下。
- ObjectLoggerServer：一个web服务，需要数据库的支持。它能够接收并保存ObjectLoggerClient发出的日志信息，支持日志的查询操作。该模块位于`server`子包下。
- react-object-logger：一个React前端组件，用于进行日志的前端展示。可以从npm官方仓库引入该组件。该子项目位于[react-object-logger](https://github.com/promise-coding/react-object-logger)。
- ObjectLoggerDemo：一个业务端集成ObjectLoggerClient的示例。该模块位于`demo`子包下。

# 2 快速上手

## 2.1 创建数据库

使用该项目的`/server/database/init_data_table.sql`文件初始化两个数据表。

## 2.2 启动Server

下载该项目下最新的Server服务jar包，地址为`/server/target/ObjectLoggerServer-*.jar`。

启动下载的jar包。

```
java -jar ObjectLoggerServer-*.jar --spring.datasource.driver-class-name={db_driver} --spring.datasource.url=jdbc:{db}://{db_address}/{db_name} --spring.datasource.username={db_username} --spring.datasource.password={db_password}
```

上述命令中的用户配置项说明如下：

- `db_driver`:你所用的数据库对应的驱动。如果使用MySql数据库则为`com.mysql.jdbc.Driver`;如果使用SqlServer数据库则为`com.microsoft.sqlserver.jdbc.SQLServerDriver`。
- `db`:数据库类型。如果使用MySql数据库则为`mysql`;如果使用SqlServer数据库则为`sqlserver`。
- `db_address`:数据库连接地址。如果数据库在本机则为`127.0.0.1`。
- `db_name`:数据库名，该数据库中需包含上一步初始化的两个数据表。
- `db_username`:数据库登录用户名。
- `db_password`:数据库登录密码。

启动jar成功后可以看到下面的界面：

<div align=center>
  <img width="80%" src="./pic/server_start.png"/>
</div>

使用浏览器访问下面的页面可以看到系统欢迎页面：

```
http://127.0.0.1:12301/ObjectLoggerServer/
```


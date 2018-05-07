# 名称：容器化的 Apache + PHP
# 用途：用作 Web 前端服务 
# 创建时间：2018.4.4

# 基础镜像
FROM centos
# 维护则信息
MAINTAINER TyIsaac tiany_li@126.com
# 指定工作目录
WORKDIR /root/
# 安装 httpd 和 php 运行中可能出现错误，但是不影响使用，可以忽略，以便安装执行。 使用 ||True 保证整个命令返回true
RUN yum -y install httpd php || true
# 安装 Mysql 客户端和 php-mysqlnd。 Mysql 是用来和远程 Mysql 服务端通信的，而php-mysqlnd 用于 PHP 和 Mysql 联系
RUN yum -y install mysql php-mysqlnd
# 创建 Apache 所必要的工作目录
RUN mkdir /var/log/httpd
RUN mkdir /var/www/
RUN mkdir /var/www/html
# /var/log/httpd 存放日志目录，/var/www/ 存放Apache 应用的数据根目录， /var/www/html/ 存放web页面的目录

# 通过环境变量定义远端 Mysql 的地址、用户名和密码。可以在容器启动时使用-e 改变
ENV MYSQL_ADDR 172.17.0.36:3306
ENV MYSQL_USER test
ENV MYSQL_PASS mypassword

# 定义启动服务必须的环境变量
ENV TERM linux
# 支持中文
ENV LC_ALL en_US.UTF-8

ADD test.php /var/www/html/test.php

EXPOSE 80

ADD run.sh /root/run.sh
RUN chmod u+x /root/run.sh
CMD /root/run.sh

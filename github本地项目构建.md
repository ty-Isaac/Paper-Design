---
title:github项目构建方式

---

```bash
echo "# Paper-Design" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:ty-Isaac/Paper-Design.git
git push -u origin master
```
## 使用

1. 配置身份
```bash
git config --global user.name "isaac" 配置用户 isaac
git config --global user.email "tiany_li@126.com"
```
去掉最后名字和邮箱可以查看配置结果

2. 初始化、创建仓库、提交等
项目根目录初始化:
    cd 跳转到项目所在路径
    eg: cd f

    git init 创建代码仓库
    git add name(文件名)    添加单个文件
    git add name(文件夹名)  添加多个文件
    git add .               添加所有文件 
    git commit -m "信息" 提交操作时加上附加信息

忽略文件:
    在仓库根目录下创建一个.gitignore文件，这个文件里指定的文件或目录会被自动忽略
    eg: 
    ```bash
        bin/
        mingbai_*
    ```
    bin目录下和以 mingbai_ 开头的文件就会被忽略掉

查看撤销修改:
    git status  查看修改  会提示所在分支信息
    git diff    查看修改内容
    git diff path/file  查看单个文件的修改情况
    git checkout path/file 撤销修改

3. 分支的用法
分支的定义：
    如果需要推出1.0版本，就可以给1.0版本建立一个分支；继而同时开发2.0版本。如果1.0版本出现bug，
    在分支上更改内容后推出新的1.0版本并且不会影响新的2.0版本。并且可以把1.0版本 bug 修改合并到 2.0相同位置
    从而使2.0不出现1.0出现的bug
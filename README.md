# YouDaoAlfredWrokflow
Alfred Workflow快速取词翻译. 使用有道词典Mac客户端查询Api.

## 使用预览

使用前缀:
![](https://github.com/ShawnFoo/YouDaoAlfredWrokflow/blob/master/image/image1.png?raw=true)

通过快捷键:
![](https://github.com/ShawnFoo/YouDaoAlfredWrokflow/blob/master/image/image2.png?raw=true)

快捷键设置推荐:
![](https://github.com/ShawnFoo/YouDaoAlfredWrokflow/blob/master/image/hotkey.png?raw=true)

## 安装方式

下载`YouDaoTranslation.alfredworkflow`到本地, 双击安装即可

## Mac客户端查词慢的原因

![](https://github.com/ShawnFoo/YouDaoAlfredWrokflow/blob/master/image/reasonslow.png?raw=true)

每输入一个字母会立马发生两个请求, 一个去查询用户可能想要查询的单词列表, 一个去查询已输入的单词释义.

关键问题是用户输入完最后1个单词后没有任何延迟就发生请求, 请求过多, 比如输入`good`一共发生了8次请求.

## TODO-List

* 查词猜测结果
* 读音
* 网页跳转




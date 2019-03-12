# flutter-iconfont2dart
This a script for transfering from iconfont.css([Alibaba Iconfont](https://www.iconfont.cn/)) file to dart file which base on dart-lang.
.
#### how to use?
At first, download your iconfont project's files, unzip them and put it in this script project's 'src' folder. Then rename the the folder's to the class's name what you want.

Secondly, go to this script project's root directory and run 'dart iconfont2dart.dart'.

Then you will see the output file in the 'dist' folder.

#### use it in flutter?
1、Modify the pubspec.yaml file, add your iconfont like this:

```
fonts:
     - family: LogisticsIcon
       fonts:
         - asset: lib/assets/font/iconfont.ttf
```

2、import the output file into the dart file which you need to use iconfont.

3、use it like this:

```
new Icon(LogisticsIcon.iconShangyiyehoutuifanhui)
```

#### 如何使用
第一步，将从iconfont下载的工程文件解压到这个脚本工程的src文件夹中，然后将它重新命名为你想要的family name。

第二步，在这个脚本工程的根目录下面运行 'dart iconfont2dart.dart'。

然后你就可以在dist文件夹中看到输出的文件

#### 怎么在flutter中使用
1、修改pubspec.yaml，像这样增加你的iconfont：

```
fonts:
     - family: LogisticsIcon
       fonts:
         - asset: lib/assets/font/iconfont.ttf
```

2、在需要使用到iconfont的dart文件中导入输出的那个文件。

3、像这样使用它：

```
new Icon(LogisticsIcon.iconShangyiyehoutuifanhui)
```


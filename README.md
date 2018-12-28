# flutter-iconfont2dart
This a script for transfering from iconfont.css(Alibaba) file to dart file which base on dart-lang.
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

import 'dart:io';

main(List<String> args) async {

  String tplFileCtx;
  File tplFile;
  Directory cssPath;
  File cssFile;
  String cssCtx;

  // output file
  String outPath = Directory.current.path + '/dist';

  // template file
  Directory tplPath = Directory(Directory.current.path  + '/iconfont2dart.tpl');
  tplFile = new File(tplPath.absolute.path);

  if (tplFile.existsSync()) {
    tplFileCtx = tplFile.readAsStringSync();
  } else {
    print('Can not find tpl file');
    return false;
  }

  // source folders
  Directory srcPath = Directory(Directory.current.path + '/src');

  // iconfont folder list
  List<FileSystemEntity> folderList = await srcPath.list().toList();

  // ignore folder list
  List<String> ignoreList = [
    '.DS_Store'
  ];

  String toUpper(List<String> upperList) {
    List<String> newList = [];
    upperList.forEach((item) {
      int idx = upperList.indexOf(item);
      if (idx == 0) {
        newList.add(item.toLowerCase());
      } else {
        if (item.length > 1) {
          newList.add(item[0].toUpperCase() + item.substring(1, item.length));
        } else if (item.length == 1) {
          newList.add(item[0].toUpperCase());
        }
      }
    });
    return newList.join('');
  }

  String toUnderline(String str) {
    List<String> newList = str.split('');
    for (int i = 0; i < newList.length; i++) {
      if (newList[i] != newList[i].toLowerCase()) {
        newList[i] = '_' + newList[i].toLowerCase();
      }
    }
    return newList.join('').substring(1, newList.join('').length);
  }


  print('creating');
  // get template content
  for (FileSystemEntity item in folderList) {

    List<String> levelList = item.absolute.path.split('/');
    String fontName = levelList[levelList.length - 1];

    // check if folder is in ignore folder list
    if (ignoreList.indexOf(fontName) == -1) {
      // get iconfont.css
      cssPath = Directory(item.absolute.path + '/iconfont.css');
      cssFile = new File(cssPath.absolute.path);
      if (cssFile.existsSync()) {
        cssCtx = cssFile.readAsStringSync();
        RegExp regExp = new RegExp('\..*?:before.*(\n|).*(\n|)?}');
        Iterable<Match> mapList = regExp.allMatches(cssCtx);
        String allIcon = '';
        for (Match mapItem in mapList) {
          List<String> strList = mapItem.group(0).split(':');
          List<String> temIconNameList = strList[0].substring(1, strList[0].length).split('-');
          String iconName = toUpper(temIconNameList);
          String iconValue = strList[2].split('\"')[1].replaceAll('\\', '');
          allIcon = allIcon + 'static const IconData ' + iconName + ' = IconData(0x' + iconValue + ', fontFamily: \'' + fontName + '\');' + '\n    ';
        }
        String temTplFileCtx = tplFileCtx.replaceAll('\$\{FontName\}', fontName).replaceAll('\$\{FontCode\}', allIcon);
        // 输出文件夹
        Directory outFolder = new Directory(outPath);
        if (!outFolder.existsSync()) {
          outFolder.createSync();
        }
        // 输出文件
        File outFile = new File(outPath + '/' + toUnderline(fontName) + '.dart');
        if (!outFile.existsSync()) {
          outFile.createSync();
        }
        outFile.writeAsStringSync(temTplFileCtx);
        print('created ' + fontName +'\'s icons successful');
      } else {
        print('Can not find ' + fontName + '\'s iconfont.css file');
        continue;
      }
    }
  }
}
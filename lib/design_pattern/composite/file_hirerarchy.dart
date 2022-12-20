import 'package:design_patterns/design_pattern/composite/directory.dart';
import 'package:design_patterns/design_pattern/composite/file.dart';
import 'package:design_patterns/design_pattern/composite/pic.dart';
import 'package:design_patterns/design_pattern/composite/txt_file.dart';

class FileHierarchy {
  static List<IFile> root = [
    Directory(title: 'Empty'),
    Directory(title: 'Pictures', children: [
      Pic(size: 102, title: 'wallpaper'),
      Pic(size: 78, title: 'mona_lisa'),
    ]),
    Directory(title: 'Presentation', children: [
      Directory(title: 'Inspiration', children: [
        TxtFile(size: 5, title: 'quote'),
        TxtFile(size: 12, title: 'poem'),
      ]),
      Directory(title: 'Images', children: [
        Pic(size: 56, title: 'cat'),
        Pic(size: 34, title: 'kitten'),
      ]),
      TxtFile(size: 22, title: 'report'),
    ]),
    TxtFile(size: 10, title: 'motivation'),
  ];
}

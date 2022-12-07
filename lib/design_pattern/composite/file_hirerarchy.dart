import 'package:design_patterns/design_pattern/composite/directory.dart';
import 'package:design_patterns/design_pattern/composite/file.dart';
import 'package:design_patterns/design_pattern/composite/pic.dart';

class FileHierarchy {
  static List<IFile> root = [
    Directory(title: 'Empty'),
    Directory(title: 'Pictures', children: [
      Pic(size: 102, title: 'wallpaper'),
      Pic(size: 78, title: 'mona_lisa'),
    ]),
    Directory(title: 'Presentation', children: [
      Directory(title: 'Inspiration', children: [
        File(size: 5, title: 'quote'),
        File(size: 12, title: 'poem'),
      ]),
      Directory(title: 'Images', children: [
        Pic(size: 56, title: 'cat'),
        Pic(size: 34, title: 'kitten'),
      ]),
      File(size: 22, title: 'report'),
    ]),
    File(size: 10, title: 'motivation'),
  ];
}

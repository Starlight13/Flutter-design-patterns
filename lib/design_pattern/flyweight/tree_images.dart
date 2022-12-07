import 'dart:math';

class TreeImages {
  static String adultTreeAsset = 'assets/tree_assets/adultTree.png';
  static String bushyTree = 'assets/tree_assets/bushyTree.png';
  static String pineTree = 'assets/tree_assets/pineTree.png';
  static String smallTree = 'assets/tree_assets/smallTree.png';

  static String randomAssetPath() {
    final assetPaths = [
      adultTreeAsset,
      bushyTree,
      pineTree,
      smallTree,
    ];
    return assetPaths[Random().nextInt(assetPaths.length)];
  }
}

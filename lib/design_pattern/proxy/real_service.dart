import 'package:design_patterns/design_pattern/proxy/image_with_title.dart';
import 'package:design_patterns/widget/common/image_loader.dart';

class RealService {
  final _catAssetPath = 'assets/cat_assets/kitten-510651.jpeg';

  Future<ImageWithTitle> get catImage async {
    return ImageWithTitle(
      image: await ImageLoader.loadImage(
        imageAssetPath: _catAssetPath,
        width: 232,
        height: 500,
        delay: const Duration(seconds: 3),
      ),
      title: 'Here is a cute real kitten!',
    );
  }
}

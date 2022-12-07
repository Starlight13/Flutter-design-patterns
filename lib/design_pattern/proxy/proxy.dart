import 'dart:ui';
import 'package:design_patterns/design_pattern/proxy/real_service.dart';
import 'package:design_patterns/design_pattern/proxy/image_with_title.dart';

class Proxy implements RealService {
  RealService? service;
  Image? cachedImage;

  @override
  Future<ImageWithTitle> get catImage async {
    if (cachedImage == null) {
      service ??= RealService();
      final image = await service!.catImage;
      cachedImage = image.image;
      return image;
    } else {
      return ImageWithTitle(
        image: cachedImage!,
        title: 'Here is a cute cached kitten!',
      );
    }
  }
}

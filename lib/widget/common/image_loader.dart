import 'dart:ui';

import 'package:flutter/services.dart';

class ImageLoader {
  static Future<Image> loadImage({
    required String imageAssetPath,
    required int width,
    required int height,
    Duration delay = Duration.zero,
  }) async {
    final ByteData data = await rootBundle.load(imageAssetPath);
    final codec = await instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: width,
      targetWidth: height,
    );
    var frame = await codec.getNextFrame();
    await Future.delayed(delay, () => {});
    return frame.image;
  }
}

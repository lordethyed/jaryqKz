import 'dart:convert';

import 'package:flutter/services.dart';

class AssetsInfo {
  Future<bool> isLocalAsset(final String assetPath) async {
    final encoded =
        utf8.encoder.convert(Uri(path: Uri.encodeFull(assetPath)).path);
    final asset = await ServicesBinding.instance.defaultBinaryMessenger
        .send('flutter/assets', encoded.buffer.asByteData());
    return asset != null;
  }
}

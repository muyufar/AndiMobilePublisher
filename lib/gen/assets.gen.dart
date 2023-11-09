/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();
AssetGenImage get imgDefaul =>
      const AssetGenImage('assets/images/ImgDefaul.png');
  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');
  AssetGenImage get banerDefault => const AssetGenImage('assets/images/defaultBN.jpg');
  AssetGenImage get logosplashscreen => const AssetGenImage('assets/images/LogoAndiHigh.png');

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/correct-teal-colour.json
  String get correctTealColour => 'assets/lottie/correct-teal-colour.json';

  /// File path: assets/lottie/empty-state-page.json
  String get emptyStatePage => 'assets/lottie/empty-state-page.json';

  /// File path: assets/lottie/login.json
  String get login => 'assets/lottie/login.json';

  /// File path: assets/lottie/warning-red.json
  String get warningRed => 'assets/lottie/warning-red.json';

  String get ebookdownload => 'assets/lottie/ebookdownloadnew.json';
  String get listloading => 'assets/lottie/animation_loadinglist.json';


  /// List of all assets
  List<String> get values =>
      [correctTealColour, emptyStatePage, login, warningRed];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}

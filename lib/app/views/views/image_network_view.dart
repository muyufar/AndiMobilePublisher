import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ImageNetworkView extends GetView {
  final String url;
  final double? height;
  final double? width;
  final Widget? child;
  final BoxDecoration? decoration;
  final BoxFit? fit;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final AlignmentGeometry? alignment;
  const ImageNetworkView({
    required this.url,
    this.height,
    this.width,
    this.margin,
    this.padding,
    this.alignment,
    this.child,
    this.decoration,
    this.fit = BoxFit.cover,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) {
        return Container(
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          alignment: alignment,
          decoration: decoration?.copyWith(
                image: DecorationImage(image: imageProvider, fit: fit),
              ) ??
              BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: fit),
              ),
          child: child,
        );
      },
      placeholder: (context, url) {
        return Container(
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          alignment: alignment,
          decoration: decoration?.copyWith(color: colorGrey),
          child: child,
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          height: height,
          width: width,
          margin: margin,
          padding: padding,
          alignment: alignment,
          decoration: decoration?.copyWith(color: colorGrey),
          child: child,
        );
      },
    );
  }
}

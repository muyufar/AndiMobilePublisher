import 'package:andipublisher/app/views/views/loading_view.dart';
import 'package:andipublisher/app/views/views/not_found_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FutureView extends GetView {
  final Future<Object?> future;
  final Widget? widgetEmpty;
  final Widget? widgetLoading;
  final Obx widgetBuilder;
  const FutureView(
      {required this.future,
      required this.widgetBuilder,
      this.widgetEmpty,
      this.widgetLoading,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == null ||
              snapshot.data.toString() == '[]' ||
              snapshot.data.toString() == '{}') {
            return widgetEmpty ?? const NotFoundView();
          } else {
            return widgetBuilder;
          }
        } else {
          return widgetLoading ?? loadingDefault();
        }
      },
    );
  }
}

import 'package:andipublisher/app/views/views/loading_view.dart';
import 'package:andipublisher/app/views/views/not_found_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

/// FutureView
///
/// This class is a Widget that displays a Future.

/// Properties
///
/// * `future`: The Future to be displayed.
/// * `widgetEmpty`: The widget to be displayed when the Future is empty.
/// * `widgetLoading`: The widget to be displayed when the Future is loading.
/// * `widgetBuilder`: The widget builder to be used to build the widget when the Future is loaded.

/// Usage
///
/// To use this class, first you need to import it. Then, you can use it to display a Future like this:
///
///
/// FutureView(
///   future: apiService.getProducts(),
///   widgetEmpty: const Text('No products found'),
///   widgetLoading: loadingDefault(),
///   widgetBuilder: (context, snapshot) {
///     if (snapshot.hasData) {
///       return ListView.builder(
///         itemCount: snapshot.data.length,
///         itemBuilder: (context, index) {
///           return Text(snapshot.data[index].name);
///         },
///       );
///     } else {
///       return widgetLoading;
///     }
///   },
/// );
///
/// This code will display a ListView of products when the Future is loaded, or a Text widget with the text "No products found" when the Future is empty.

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

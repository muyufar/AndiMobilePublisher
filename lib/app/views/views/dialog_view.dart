import 'package:flutter/material.dart';

/// dialogView
///
/// This method creates an alert dialog.

/// Parameters
///
/// * `title`: The title of the alert dialog.
/// * `content`: The content of the alert dialog.
/// * `onTapOke`: The callback function when the "Oke" button is tapped.
/// * `onTapBack`: The callback function when the "Kembali" button is tapped.

/// Returns
///
/// An AlertDialog widget.

/// Usage
///
/// To use this method, first you need to import it. Then, you can use it to create an alert dialog like this:
///
///
/// dialogView(
///   title: 'Title',
///   content: 'Content',
///   onTapOke: () {
///     // Do something when "Oke" button is tapped.
///   },
/// );
///
/// This code will create an alert dialog with the title "Title", the content "Content", and the "Oke" button.

AlertDialog dialogView(
    {required String title,
     required String content,
    required Function() onTapOke,
    Function()? onTapBack}) {
  return AlertDialog(
    title: Text(title),
    content: Text(content),
    actions: [
      Visibility(
        visible: onTapBack != null,
        child: TextButton(
          onPressed: onTapBack,
          child: const Text('Kembali'),
        ),
      ),
      TextButton(
        onPressed: onTapOke,
        child: const Text('Oke'),
      ),
    ],
  );
}

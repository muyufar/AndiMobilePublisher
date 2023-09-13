import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// textFromFiled
///
/// This method creates a TextFormField widget.

/// Parameters
///
/// * `controller`: The controller of the TextFormField.
/// * `labelText`: The label text of the TextFormField.
/// * `prefixIcon`: The prefix icon of the TextFormField.
/// * `textInputAction`: The text input action of the TextFormField.
/// * `keyboardType`: The keyboard type of the TextFormField.
/// * `obscureText`: Whether the TextFormField is obscureText.
/// * `suffixIcon`: The suffix icon of the TextFormField.
/// * `validator`: The validator function of the TextFormField.

/// Returns
///
/// A TextFormField widget.

/// Usage
///
/// To use this method, first you need to import it. Then, you can use it to create a TextFormField widget like this:
///
///
/// textFromFiled(
///   controller: nameController,
///   labelText: 'Name',
///   prefixIcon: Icon(Icons.person),
///   validator: (value) {
///     if (value!.isEmpty) {
///       return 'Please enter your name';
///     }
///     return null;
///   },
/// );
///
/// This code will create a TextFormField widget with the label text "Name" and the prefix icon of an icon person. The TextFormField will also have a validator function that checks if the value is empty.

TextFormField textFromFiled({
  required TextEditingController controller,
  required String labelText,
  required Icon prefixIcon,
  TextInputAction textInputAction = TextInputAction.next,
  TextInputType? keyboardType,
  bool obscureText = false,
  Widget? suffixIcon,
  required Function(String?) validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    obscureText: obscureText,
    textInputAction: textInputAction,
    decoration: InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      hintStyle: TextStyle(color: Colors.grey.shade600),
      fillColor: Colors.white70,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      labelText: labelText,
      labelStyle: TextStyle(fontSize: 14, color: Colors.grey.shade600),
    ),
    validator: (value) => validator(value),
  );
}

/// quantityInput
///
/// This method creates a widget that displays a quantity input.

/// Parameters
///
/// * `value`: The current quantity.
/// * `maxValue`: The maximum quantity.
/// * `onTapMinus`: The callback function when the "Minus" button is tapped.
/// * `onTapPlus`: The callback function when the "Plus" button is tapped.

/// Returns
///
/// A widget that displays a quantity input.

/// Usage
///
/// To use this method, first you need to import it. Then, you can use it to create a quantity input widget like this:
///
///
/// quantityInput(
///   value: quantity,
///   maxValue: 10,
///   onTapMinus: () {
///     quantity--;
///   },
///   onTapPlus: () {
///     quantity++;
///   },
/// );
///
/// This code will create a widget that displays a quantity input with the initial quantity of 1. When the "Minus" button is tapped, the quantity will be decreased by 1. When the "Plus" button is tapped, the quantity will be increased by 1.

Widget quantityInput(
    {required RxInt value,
    required RxInt maxValue,
    required Function() onTapMinus,
    required Function() onTapPlus}) {
  return Obx(
    () => Row(
      children: [
        TextButton(
            onPressed: (value.value > 1) ? onTapMinus : null,
            child: const Text('-')),
        Text(value.toString()),
        TextButton(
            onPressed: (value.value < maxValue.value) ? onTapPlus : null,
            child: const Text('+'))
      ],
    ),
  );
}

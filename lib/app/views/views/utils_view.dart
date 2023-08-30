import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/forgot_password.controller.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ForgotPasswordScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ForgotPasswordScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

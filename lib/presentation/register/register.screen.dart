import 'package:andipublisher/app/controllers/validator_controller.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'dart:io'; // Untuk mengimpor dart:io

import 'controllers/register.controller.dart';

class RegisterScreen extends GetView<RegisterController> {
  const RegisterScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        toolbarHeight: 0,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: marginHorizontal, vertical: 24),
        children: [
          SizedBox(height: 20),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(Assets.images.logo.path),
                  fit: BoxFit.contain,
                ),
                boxShadow: [
                  BoxShadow(
                      color: colorGrey,
                      blurRadius: 4,
                      offset: const Offset(2, 4))
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Daftar Baru',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: colorPrimary),
          ),
          SizedBox(height: 8),
          const Text('Daftar baru untuk pembuatan akun'),
          SizedBox(height: 40),
          Form(
            key: controller.formKey,
            child: Obx(
              () => Column(
                children: [
                _imageProfile(),
                                  SizedBox(height: 30),

                  _textFromFiled(
                    controller: controller.fullNameTextEditingController,
                    prefixIcon: Icon(
                      Ionicons.person_outline,
                      color: Colors.grey.shade600,
                    ),
                    labelText: 'Nama Lengkap',
                    validator: (value) => controller
                        .validatorController
                        .validatorFullName(value),
                  ),
                  SizedBox(height: 30),
                  _textFromFiled(
                    controller: controller.numberTextEditingController,
                    prefixIcon: Icon(
                      Ionicons.person_outline,
                      color: Colors.grey.shade600,
                    ),
                    labelText: 'Nomor Telepon',
                    keyboardType: TextInputType.phone,
                    validator: (value) => controller
                        .validatorController
                        .validatorNumberPhone(value),
                  ),
                  SizedBox(height: 30),
                  _textFromFiled(
                    controller: controller.emailTextEditingController,
                    prefixIcon: Icon(
                      Ionicons.mail_outline,
                      color: Colors.grey.shade600,
                    ),
                    labelText: 'Email',
                    validator: (value) => controller
                        .validatorController
                        .validatorEmail(value),
                  ),
                  SizedBox(height: 30),
                  _textFromFiled(
                    controller: controller.passwordTextEditingController,
                    prefixIcon: Icon(
                      Ionicons.key_outline,
                      color: Colors.grey.shade600,
                    ),
                    labelText: 'Kata Sandi',
                    obscureText: !controller.obscureTextPassword.value,
                    suffixIcon: IconButton(
                      onPressed: () =>
                          controller.obscureTextPassword.toggle(),
                      icon: (controller.obscureTextPassword.value)
                          ? Icon(Ionicons.eye_outline,
                              color: Colors.grey.shade600)
                          : Icon(Ionicons.eye_off_outline,
                              color: Colors.grey.shade600),
                    ),
                    validator: (value) => controller
                        .validatorController
                        .validatorPassword(value),
                  ),
                  SizedBox(height: 30),
                  _textFromFiled(
                    controller:
                        controller.confirmationPasswordTextEditingController,
                    prefixIcon: Icon(
                      Ionicons.key_outline,
                      color: Colors.grey.shade600,
                    ),
                    textInputAction: TextInputAction.go,
                    obscureText:
                        !controller.obscureTextConfirmationPassword.value,
                    labelText: 'Konfirmasi Kata Sandi',
                    suffixIcon: IconButton(
                      onPressed: () =>
                          controller.obscureTextConfirmationPassword.toggle(),
                      icon: (controller.obscureTextConfirmationPassword.value)
                          ? Icon(Ionicons.eye_outline,
                              color: Colors.grey.shade600)
                          : Icon(Ionicons.eye_off_outline,
                              color: Colors.grey.shade600),
                    ),
                    validator: (value) => controller
                        .validatorController
                        .validatorConfirmationPassword(
                            val: value,
                            passwordTextEditingController:
                                controller.passwordTextEditingController.text),
                  ),
                  SizedBox(height: 70),
                  SizedBox(
                    width: Get.width,
                    child: ElevatedButton(
                      onPressed: () => controller.onTapRegister(),
                      child: const Text('Daftar'),
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Sudah Punya Akun ? '),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: colorPrimary),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextFormField _textFromFiled({
    required TextEditingController controller,
    required Icon prefixIcon,
    required String labelText,
    TextInputType keyboardType = TextInputType.emailAddress,
    TextInputAction textInputAction = TextInputAction.next,
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

  Center _imageProfile() {
    return Center(
      child: SizedBox(
        height: 120,
        width: 140,
        child: Obx(
          () => Stack(
            children: [
              (controller.pathImage?.value == null ||
                      controller.pathImage!.value.isEmpty)
                  ? Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(Assets.images.imgDefaul.path),
                          fit: BoxFit.contain,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: colorGrey,
                              blurRadius: 4,
                              offset: const Offset(2, 4))
                        ],
                      ),
                    )
                  : Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: FileImage(File(controller.pathImage!.value)),
                          fit: BoxFit.contain,
                        ),
                        boxShadow: [
                          BoxShadow(
                              color: colorGrey,
                              blurRadius: 4,
                              offset: const Offset(2, 4))
                        ],
                      ),
                    ),
              Align(
                alignment: Alignment.bottomRight,
                child: (controller.pathImage?.value == null ||
                        controller.pathImage!.value.isEmpty)
                    ? ElevatedButton(
                        onPressed: () async {
                          controller.image = await controller.getImage();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
                        ),
                        child: const Icon(Ionicons.camera_outline))
                    : ElevatedButton(
                        onPressed: () => controller.onTapDeteleImage(),
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: colorRad,
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
                        ),
                        child: const Icon(Ionicons.close)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

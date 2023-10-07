import 'package:andipublisher/app/views/views/app_bar_view.dart';
import 'package:andipublisher/app/views/views/utils_view.dart';
import 'package:andipublisher/gen/assets.gen.dart';
import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:andipublisher/infrastructure/theme/theme_utils.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import 'controllers/login.controller.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return Scaffold(
      appBar: appBarStandar(context: context),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: marginHorizontal),
          children: [
            SizedBox(
              height: Get.height - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 8),
                    child: Image.asset(Assets.images.logo.path,
                        fit: BoxFit.contain),
                  ),
                  const Text(
                    'Selamat Datang',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Text('Masuk Untuk Melanjutkan'),
                  const Spacer(flex: 2),
                  Form(
                      key: controller.formKey,
                      child: Column(
                        children: [
                          textFromFiled(
                            controller: controller.emailTextEditingController,
                            keyboardType: TextInputType.emailAddress,
                            labelText: 'Email',
                            prefixIcon: Icon(
                              Ionicons.mail_outline,
                              color: Colors.grey.shade600,
                            ),
                            validator: (val) => controller.validatorController
                                .validatorIdentifier(val),
                          ),
                          const SizedBox(height: 20),
                          Obx(
                            () => textFromFiled(
                              controller: controller.passTextEditingController,
                              obscureText: !controller.showPassowrd.value,
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.go,
                              labelText: 'Kata Sandi',
                              prefixIcon: Icon(
                                Ionicons.key_outline,
                                color: Colors.grey.shade600,
                              ),
                              suffixIcon: IconButton(
                                onPressed: () =>
                                    controller.showPassowrd.toggle(),
                                icon: (controller.showPassowrd.value)
                                    ? Icon(Ionicons.eye_outline,
                                        color: Colors.grey.shade600)
                                    : Icon(Ionicons.eye_off_outline,
                                        color: Colors.grey.shade600),
                              ),
                              validator: (val) => controller.validatorController
                                  .validatorPassword(val),
                            ),
                          ),
                          // Align(
                          //   alignment: Alignment.centerRight,
                          //   child: TextButton(
                          //       onPressed: () =>
                          //           Get.toNamed(Routes.FORGOT_PASSWORD),
                          //       child: const Text('Lupa Kata Sandi')),
                          // ),
                          SizedBox(
                            width: Get.width,
                            child: ElevatedButton(
                              onPressed: () => controller.oTapLogin(),
                              child: const Text('Masuk'),
                            ),
                          ),
                        ],
                      )),
                  const Spacer(flex: 1),
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: 'Belum  punya akun? ',
                            style: TextStyle(color: colorTextGrey)),
                        TextSpan(
                            text: 'Daftar Baru',
                            style: TextStyle(
                                color: colorTextPrimary,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Get.toNamed(Routes.REGISTER)),
                      ]),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            ),
          ]),
    );
  }
}

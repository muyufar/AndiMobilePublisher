import 'dart:developer';

import 'package:andipublisher/infrastructure/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'controllers/payment.controller.dart';

class PaymentScreen extends GetView<PaymentController> {
  const PaymentScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
        crossPlatform: InAppWebViewOptions(
          useShouldOverrideUrlLoading: true,
          mediaPlaybackRequiresUserGesture: false,
        ),
        android: AndroidInAppWebViewOptions(
          useHybridComposition: true,
        ),
        ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
        ));
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                  key: controller.webViewKey,
                  initialOptions: options,
                  initialUrlRequest:
                      URLRequest(url: Uri.parse(controller.paymentModel.url)),
                  shouldOverrideUrlLoading:
                      (controller, navigationAction) async {
                    final uri = navigationAction.request.url!;

                    log('url ${navigationAction.request.url}');
                    // if ((uri.toString()).startsWith(
                    //     'https://dev.andipublisher.com/midtrans/transaksi/finish?')) {
                    //   Get.offAllNamed(Routes.MAIN);
                    //   return null;
                    // } else if ((uri.toString())
                    //     .startsWith('https://app.midtrans.com')) {
                    //   return null;
                    // } else if ((uri.toString())
                    //     .startsWith('https://app.sandbox.midtrans.com')) {
                    //   return null;
                    // }
                    log('test1' + uri.toString());
                    if ((uri.toString()).contains('finish')) {
                      Get.offAllNamed(Routes.MAIN);
                      return null;
                    } else if ((uri.toString())
                        .startsWith('https://app.midtrans.com')) {
                      return null;
                    } else if ((uri.toString())
                        .startsWith('https://app.sandbox.midtrans.com')) {
                      return null;
                    }
                    launchUrl(Uri.parse(uri.toString()),
                        mode: LaunchMode.externalApplication);
                    return NavigationActionPolicy.CANCEL;
                  })
            ],
          ),
        ),
      ),
    );
  }
}

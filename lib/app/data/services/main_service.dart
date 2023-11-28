import 'dart:convert';
import 'dart:developer';

import 'package:andipublisher/app/controllers/utils_controller.dart';
import 'package:andipublisher/app/views/views/dialog_view.dart';
import 'package:andipublisher/app/views/views/loading_view.dart';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';

/// MainService
///
/// This class is a service for making api requests. It provides methods for
/// making post and get requests.

/// Properties
///
/// * `urlAPIMain`: The base url of the api.
/// * `urlRedirect`: The redirect url of the api.
/// * `username`: The username for basic authentication.
/// * `password`: The password for basic authentication.
/// * `basicAuth`: The base64 encoded string of the username and password.

class MainService {
  /// Methods
  ///
  /// * `postAPI(url, body, [client])`: This method makes a post request to the api.
  /// * `getAPI(url, body, [client])`: This method makes a get request to the api.
  /// * `postAPIBodyRaw(url, body, [client])`: This method makes a post request to the api with a raw json body.

  final UtilsController utilsController = Get.put(UtilsController());

  String urlAPIMain = 'https://api.andipublisher.com/';
  late String urlRedirect = '${urlAPIMain}api/dev/';

  String username = 'admin';
  String password = '1234';
  late String basicAuth =
      'Basic ${base64.encode(utf8.encode('$username:$password'))}';

  Future<dynamic> postAPI(
      {required String url, Map? body, http.Client? client}) async {
    client ??= http.Client();
    String apiHttp = urlRedirect + url;

    utilsController.checkConnection();

    Get.dialog(loadingDefault(), barrierDismissible: false);

    final response = await http.post(Uri.parse(apiHttp),
        body: body, headers: {'authorization': basicAuth});

    log('Url:$apiHttp\nBody\n$body\n${response.body}');

    final result = jsonDecode(response.body);

    if (!result['status']) {
      Get.dialog(dialogView(
        title: 'Error',
        content: result['message'],
        onTapOke: () {
          Get.back();
          Get.back();
        },
      ));
      return;
    }

    Get.back();

    return result;
  }

  Future<dynamic> getAPI(
      {required String url,
      Map<String, dynamic>? body,
      http.Client? client}) async {
    client ??= http.Client();
    String queryString = Uri(queryParameters: body).query;
    print('object1');
    String apiHttp = '$urlRedirect$url?$queryString';

    await utilsController.checkConnection();
    final response = await http
        .get(Uri.parse(apiHttp), headers: {'authorization': basicAuth});

    log('Url:$apiHttp\nBody\n$body\n${response.body}');

    final result = jsonDecode(response.body);

    if (!result['status']) {
      Get.dialog(dialogView(
        title: 'Error',
        content: result['message'],
        onTapOke: () => Get.back(),
      ));
      return;
    }

    return result;
  }

  Future<dynamic> postAPIBodyRaw(
      {required String url, Map? body, http.Client? client}) async {
    String apiHttp = urlRedirect + url;
    client ??= http.Client();

    var rawJson = json.encode(body);

    Get.dialog(loadingDefault(), barrierDismissible: false);

    final response = await http.post(Uri.parse(apiHttp),
        headers: {
          "Content-Type": "application/json",
          'authorization': basicAuth
        },
        body: rawJson);

    log('Url: $apiHttp\nBody\n$body\n${response.body}');

    final result = jsonDecode(response.body);

    Get.back();

    if (!result['status']) {
      Get.dialog(dialogView(
        title: 'Error',
        content: result['message'],
        onTapOke: () {
          Get.back();
          Get.back();
        },
      ));
      return;
    }

    return result;
  }

  /// Usage
  ///
  /// To use this class, you first need to instantiate it. Then, you can use the
  /// `postAPI()`, `getAPI()`, and `postAPIBodyRaw()` methods to make api requests.
  ///
  /// For example, the following code makes a post request to the api:
  ///
  ///
  /// MainService mainService = MainService();
  /// dynamic result = await mainService.postAPI(url: '/users', body: {'name': 'John Doe'});
  ///
  /// This code will make a post request to the `/users` endpoint of the api with the body `{'name': 'John Doe'}`.
}

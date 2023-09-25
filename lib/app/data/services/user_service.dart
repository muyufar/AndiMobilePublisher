import 'dart:io';

import 'package:andipublisher/app/data/models/user_model.dart';
import 'package:andipublisher/app/data/services/main_service.dart';

class UserService {
  static Future<UserModel> login(
      {required String email, required String password}) async {
    Map body = {
      'email': email,
      'password': password,
    };

    final result = await MainService().postAPI(url: 'User/auth', body: body);

    return UserModel.fromMap(result['data']);
  }

  static Future<UserModel> register(
    { required String name,
    required String email,
    required String noPhone,
    required String password,
    File? imageProfile})  async {
      Map body = {
          'name': name,
          'email': email,
          'phone' : noPhone,
          'password': password,
          'photo': imageProfile,
      };
      final result = await MainService().postAPI(url: 'register', body: body);
      return UserModel.fromMap(result['data']);
    }
}

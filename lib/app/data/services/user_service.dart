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
}

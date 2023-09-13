import 'package:get/get.dart';

/// ValidatorController
///
/// This class is a controller for validation functions. It provides methods for validating identifiers, passwords, full names, phone numbers, emails, and confirmation passwords.

class ValidatorController extends GetxController {
  /// Methods
  ///
  /// * validatorIdentifier(String? val): This method validates the identifier. The identifier must not contain spaces and must be a valid email address.
  /// * validatorPassword(String? val): This method validates the password. The password must be at least 6 characters long.
  /// * validatorFullName(String? val): This method validates the full name. The full name must be at least 3 characters long.
  /// * validatorNumberPhone(String? val): This method validates the phone number. The phone number must be a valid Indonesian phone number.
  /// * validatorEmail(String? val): This method validates the email address. The email address must be a valid email address.
  /// * validatorConfirmationPassword(String? val, required String passwordTextEditingController): This method validates the confirmation password. The confirmation password must be the same as the password.

  String? validatorIdentifier(String? val) {
    if (val!.contains(' ')) {
      return 'Identifikasi Anda menggunakan spasi';
    }

    return (GetUtils.isEmail(val)) ? null : 'Identifikasi Anda salah';
  }

  String? validatorPassword(String? val) {
    return (val!.length >= 6) ? null : 'Kata sandi minimal 6 digit';
  }

  String? validatorFullName(String? val) {
    return (val!.length >= 3) ? null : 'Silakan masukkan nama lengkap';
  }

  String? validatorNumberPhone(String? val) {
    return (GetUtils.isPhoneNumber(val!))
        ? null
        : 'Periksa kembali nomor telepon Anda';
  }

  String? validatorEmail(String? val) {
    if (val!.contains(' ')) {
      return 'Email Anda menggunakan spasi';
    }

    return (GetUtils.isEmail(val)) ? null : 'Email Anda tidak valid';
  }

  String? validatorConfirmationPassword(
      {String? val, required String passwordTextEditingController}) {
    return (val == passwordTextEditingController)
        ? null
        : 'Password Anda tidak sama';
  }

  /// Usage
  ///
  /// To use this class, you first need to instantiate it. Then, you can use the validatorIdentifier(), validatorPassword(), validatorFullName(), validatorNumberPhone(), validatorEmail(), and validatorConfirmationPassword() methods to validate the input fields.
  ///
  /// For example, the following code validates the identifier:
  ///
  ///
  /// ValidatorController validatorController = Get.put(ValidatorController());
  /// String? errorIdentifier = validatorController.validatorIdentifier(identifier);
  ///
  /// This code will return an error message if the identifier is invalid.
  ///
}

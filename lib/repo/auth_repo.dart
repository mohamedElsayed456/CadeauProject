import 'dart:convert';

import 'package:demo_project/models/login_model.dart';
import 'package:demo_project/services/auth_service.dart';

class AuthRepo {
  final authService = AuthServices();

  Future<bool> login({
    required String code,
    required String phoneNumber,
    required String password,
  }) async {
    final response = await authService.login(
        code: code, phoneNumber: phoneNumber, password: password);
    if (response.statusCode == 200) {
      final Map<String, dynamic> extractedData = jsonDecode(response.body);
      // ignore: unused_local_variable
      LoginModel model = LoginModel.fromJson(extractedData['data']['user']);
      return true;
    }else{
      return false;
    }
  }
}
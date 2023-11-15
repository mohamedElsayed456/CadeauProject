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


  //Logout repo
   Future<bool> logout()async{
    final response=await authService.logout();
    if(response.statusCode==200){
        // ignore: unused_local_variable
        final Map<String,dynamic>extractedData = jsonDecode(response.body);
        return true;
    }
    else{
      return false;
    }
  }

 
   Future<bool?> sendCode(
    String phoneNumber,
    String countryCode,
    ) async {
   final response= await authService.sendCode(phoneNumber,countryCode);
     if(response.statusCode==200){
          print ('mohamed');
          print(response);
    } else {
      // Handle error
      print('Error sending code: ${response.statusCode}');
      return false;
    }
     return null;
  }
}

import 'dart:convert';

import 'package:demo_project/models/login_model.dart';
import 'package:demo_project/shared/components/components.dart';
import 'package:demo_project/shared/sharedpreferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;




class LoginProvider with ChangeNotifier{
   String code = '';
   String phoneNumber = '';
   String password = '';

  

Future<Map<String,dynamic>>userLogin(
    String code,
    String phoneNumber,
    String password,
    )   async{
      var result;
      final Map<String,dynamic>loginData = {
        "user": {
        "country_code": code,
        "phone_number":phoneNumber,
        "password": password,
    },
    "device": {
        "device_type": "android", //"android" , "ios" , "web", "unknown"
        "fcm_token": "dummy"
    }

      };
 
    
       final response = await http.post(
      Uri.parse(AppUrl.login),
       body:json.encode(loginData),
      headers: {
     'Accept-Language': 'en',
     'Timezone': 'Cairo',
      'Content-Type': 'application/json',
      'Cookie': '__profilin=p%3Dt'
     } ,
     );
       print("body = ${loginData.toString()}") ; 
     print("state = ${response.statusCode}") ; 
     if(response.statusCode == 200){
      final Map<String,dynamic>responseData=json.decode(response.body);
       print("----- 200 -----");

      print(responseData);

      //var userData = responseData['Content'];
      LoginModel loginModel= LoginModel.fromJson(responseData);
      UserPreferences().saveuser(loginModel.data);

      result={
       'status':true,
       'message':'Successful',
      };

     }else{
       print("----- xxx -----");
    
     }
      return result;
  }


  bool get isButtonEnabled =>
      phoneNumber.isNotEmpty && password.isNotEmpty;
      
  void updateCountryCode(String value) {
    code = value ;
    notifyListeners();
  }

  void updatePhoneNumber(String value) {
    phoneNumber = value ;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }
}
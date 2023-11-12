import 'package:flutter/material.dart';


class LoginProvider with ChangeNotifier {
  bool _isloading = false;
  bool get isloading => _isloading;
  void setIsloading(bool val) {
    _isloading = val;
    notifyListeners();
  }
 
   bool _isObscure = true;
   bool get isObscure => _isObscure;
   void togglePasswordVisibility() {
    _isObscure = !_isObscure;
    notifyListeners();
  }


  String code = '';
  String phoneNumber = '';
  String password = '';


  bool get isButtonEnabled => phoneNumber.isNotEmpty && password.isNotEmpty;

  void updateCountryCode(String value){
    code = value;
    notifyListeners();
  }

  void updatePhoneNumber(String value){
    phoneNumber = value;
    notifyListeners();
  }

  void updatePassword(String value){
    password = value;
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class LogoutProvider extends ChangeNotifier{
  bool _isloading = false;
  bool get isloading => _isloading ;
  void setIsdloading(bool val){
    _isloading=val;
    notifyListeners();
 }
}
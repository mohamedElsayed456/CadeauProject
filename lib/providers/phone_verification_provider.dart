import 'package:demo_project/repo/auth_repo.dart';
import 'package:flutter/material.dart';


class PhoneVerificationProvider extends ChangeNotifier{

bool _isloading = false;
  bool get isloading => _isloading;
  void setIsloading(bool val) {
    _isloading = val;
    notifyListeners();
  }

final authRepo = AuthRepo();

  Future<void> sendCode(
    String countryCode,
    String phoneNumber,
   
    ) async {
    await authRepo.sendCode(countryCode,phoneNumber);
    notifyListeners();
  }

 
}
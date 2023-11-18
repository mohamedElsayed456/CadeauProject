import 'package:demo_project/models/occasion_model.dart';
import 'package:demo_project/repo/occasion_repo.dart';
import 'package:flutter/material.dart';


class OccasionsProvider extends ChangeNotifier {
bool _isloading = false;
  bool get isloading => _isloading;
  void setIsloading(bool val) {
    _isloading = val;
    notifyListeners();
  }
 

  List<OccasionsModel>occModel = [];
  final occasionRepo = OccasionRepo();

  Future<void>occProvider()async{
      _isloading=true;
      notifyListeners();
    final occList = await occasionRepo.occasion();
     occModel=occList!;
    _isloading=false;
    notifyListeners();

  }

  int currentIndex=0;
  void changebottom(int index){
    currentIndex = index;
    notifyListeners();
   }
   

}
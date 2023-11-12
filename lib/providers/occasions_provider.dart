import 'package:demo_project/models/occasion_model.dart';
import 'package:demo_project/repo/occasion_repo.dart';
import 'package:flutter/material.dart';


class OccasionsProvider extends ChangeNotifier {
 bool _isLoading = false;
bool get isLoading => _isLoading;
 

  List<OccasionsModel>occModel = [];
  final occasionRepo = OccasionRepo();

  Future<void>occProvider()async{
      _isLoading=true;
      notifyListeners();
    final occList = await occasionRepo.occasion();
     occModel=occList!;
    _isLoading=false;
    notifyListeners();

  }

  int currentIndex=0;
  void changebottom(int index){
    currentIndex = index;
    notifyListeners();
   }
   

}
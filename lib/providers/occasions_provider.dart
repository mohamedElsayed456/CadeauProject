import 'package:demo_project/models/occasion_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:http/http.dart';

class OccasionsProvider extends ChangeNotifier{
  bool isloading=true;
  String error='';
  OccasionsModel model = OccasionsModel(
    message: '',
    data: Data(occasionTypes:[]),
    extra: Extra.fromJson({}),
    );
  static const occasionUrl='http://3.65.222.77/api/v1/lookups/occasion_types';

    getoccasiondata()async{
    try{
     Response response = await http.get(
        Uri.parse(occasionUrl),
        headers:{
          'Cookie': '__profilin=p%3Dt',
        }
      );
      if(response.statusCode==200){
        model = occasionsFromJson(response.body);
      }
      else{
        error=response.statusCode.toString();
      }
    }catch(e){
      e.toString();
    }
    isloading=false;
    notifyListeners();
  }

  
  int currentIndex=0;
  void changebottom(int index){
    currentIndex = index;
    notifyListeners();
   }
   

}
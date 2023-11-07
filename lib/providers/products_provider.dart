import 'package:demo_project/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;

class ProductsProvider extends ChangeNotifier{
  bool isloading = true;
  String error='';
  
  ProductsModel product=ProductsModel(
    message: 'message',
     data:Data(products: []),
      extra:Extra.fromJson({}),
      );

   getProductsData(int productID)async{
    try{
    Response response = await http.get(
        Uri.parse('http://3.65.222.77/api/v1/products?occasion_type_id=$productID'),
        headers:{
          'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhYmxlX2lkIjoxMDEsImF1dGhlbnRpY2FibGVfdHlwZSI6IkN1c3RvbWVyIiwiZGV2aWNlIjoxNjk2LCJjcmVhdGVkX2F0IjoxNjk3MDI4NTk1LCJleHAiOjQ4NTI3MjM3OTV9.3inC5djc9cE-4JyQX4faFsD2VptXtScCYJ4gt3n-ap0',
          'Cookie': '__profilin=p%3Dt'
        }
      );
   if(response.statusCode==200){
       product = productsFromJson(response.body);
      }
      else{
        error=response.statusCode.toString();
      }
    }catch(e){
      e.toString();
    }
    isloading = false;
    notifyListeners();
  }
 
}

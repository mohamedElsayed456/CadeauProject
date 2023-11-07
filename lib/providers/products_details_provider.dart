import 'dart:developer';

import 'package:demo_project/models/products_details_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart'as http;

class ProductsDetailsProvider extends ChangeNotifier{
  bool isloading = true;
  String error='';
  
  ProductsdetailsModel show = ProductsdetailsModel(
    message: 'message', 
    data:Data.fromJson({}),
  );

   getProductsDetailsData(int iD)async{
    // try{
    Response response = await http.get(
        Uri.parse('http://3.65.222.77/api/v1/products/$iD'),
        headers:{
           'Timezone': 'Cairo',
           'Authorization': 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdXRoZW50aWNhYmxlX2lkIjoxMDEsImF1dGhlbnRpY2FibGVfdHlwZSI6IkN1c3RvbWVyIiwiZGV2aWNlIjoxNjk2LCJjcmVhdGVkX2F0IjoxNjk3MDI4NTk1LCJleHAiOjQ4NTI3MjM3OTV9.3inC5djc9cE-4JyQX4faFsD2VptXtScCYJ4gt3n-ap0',

        }
      );

       log("response :: ${response.body}");

   if(response.statusCode==200){
       
      show =productsdetailsFromJson(response.body);
      }
      else{
        error=response.statusCode.toString();
      }

    isloading = false;
    notifyListeners();
  }
 
}

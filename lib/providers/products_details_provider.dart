import 'package:demo_project/models/products_details_model.dart';
import 'package:demo_project/repo/products_details_repo.dart';
import 'package:flutter/material.dart';


class ProductsDetailsProvider extends ChangeNotifier{
  bool _isloading = false;
  bool get isloading => _isloading;
  void setIsloading(bool val) {
    _isloading = val;
    notifyListeners();
  }

   ProductsDetailsModel product = ProductsDetailsModel();
     final productDetailsRepo=ProductsDetailsRepo();

    void updateProductDetails(ProductsDetailsModel value){
    product=value;
    notifyListeners();
   }
  
  
}

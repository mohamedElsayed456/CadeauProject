import 'package:demo_project/models/products_details_model.dart';
import 'package:demo_project/repo/products_details_repo.dart';
import 'package:flutter/material.dart';


class ProductsDetailsProvider extends ChangeNotifier{
  bool isloading = false;

   ProductsDetailsModel product = ProductsDetailsModel();
     final productDetailsRepo=ProductsDetailsRepo();

    Future<void> productDetailsProvider(int id)async{
    isloading=true;
    notifyListeners();
    final productDetails=await productDetailsRepo.getProductsDetails(id);
    product=productDetails!;
    isloading=false;
    notifyListeners();
  } 
  
  
}

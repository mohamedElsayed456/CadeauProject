import 'package:demo_project/models/products_model.dart';
import 'package:demo_project/repo/products_repo.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier{
 
bool _isloading = false;
  bool get isloading => _isloading;
  void setIsloading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  List<ProductsModel>proModel=[];
  final productRepo = ProductsRepo();

  Future<void>productListProvider(int productId)async{
     _isloading=true;
     notifyListeners();
    final proList = await productRepo.product(productId);
     proModel=proList!;
    _isloading=false;
    notifyListeners();

  }
}

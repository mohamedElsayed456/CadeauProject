import 'package:demo_project/models/products_model.dart';
import 'package:demo_project/repo/products_repo.dart';
import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier{
 
bool _isLoading = false;
bool get isLoading => _isLoading;

  List<ProductsModel>proModel=[];
  final productRepo = ProductsRepo();

  Future<void>productListProvider(int productId)async{
     _isLoading=true;
     notifyListeners();
    final proList = await productRepo.product(productId);
     proModel=proList!;
    _isLoading=false;
    notifyListeners();

  }
}

import 'dart:convert';
import 'package:demo_project/models/products_model.dart';
import 'package:demo_project/services/products_service.dart';

class ProductsRepo {
  final productsService = ProductsService();

  Future<List<ProductsModel>?>product(int productId)async{
   
   final response = await productsService.productList(productId);
    if (response.statusCode == 200){

       final Map<String, dynamic> extractedData = json.decode(response.body);
        final productsList = extractedData['data']['products'];

        final List<ProductsModel> productType = ProductsModel.productList(productsList);
     
        return productType;
        }
        else{
        return null;
       }

  }
}
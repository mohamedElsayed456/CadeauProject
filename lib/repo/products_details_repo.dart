import 'dart:convert';

import 'package:demo_project/models/products_details_model.dart';
import 'package:demo_project/services/products_details_service.dart';

class ProductsDetailsRepo{
  final productDetailsService = ProductsDetailsService(); 
  Future<ProductsDetailsModel?> getProductsDetails(int id)async{
    final response = await productDetailsService.productsDetailsService(id);
     if(response.statusCode==200){
      final Map<String,dynamic>extractedData=json.decode(response.body);
      
      final productDetails=extractedData['data']['product'];

      final prodDetails=ProductsDetailsModel.fromJson(productDetails);
      return prodDetails;
    }
    else{
      return null; 
    }

  }
}
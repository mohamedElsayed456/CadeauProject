import 'package:demo_project/shared/constants/endpoints.dart';
import 'package:demo_project/shared/constants/environment.dart';
import 'package:http/http.dart'as http;

class ProductsDetailsService{
   Future<http.Response> productsDetailsService(int productId) async {
    final response = await http.get(
      Uri.parse('${Environment.baseUrl}${Endpoints.productDetails}/$productId')
      );
    return response;
  }
}
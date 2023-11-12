import 'package:demo_project/shared/constants/endpoints.dart';
import 'package:demo_project/shared/constants/environment.dart';
import 'package:http/http.dart'as http;

class ProductsService{
  Future<http.Response>productList(int productId)async{
    final http.Response response= await http.get(
      Uri.parse('${Environment.baseUrl}${Endpoints.product}occasion_type_id=$productId'),
    );
    return response;
  }
}
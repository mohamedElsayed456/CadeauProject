import 'package:demo_project/shared/constants/endpoints.dart';
import 'package:demo_project/shared/constants/environment.dart';
import 'package:http/http.dart'as http;

class OccasionService{
  Future<http.Response>occasion()async{
     Map<String, String>? headers = {
        'Cookie': '__profilin=p%3Dt',
    };
    final http.Response response= await http.get(
      Uri.parse('${Environment.baseUrl}${Endpoints.occasion}'),
      headers: headers,
    );
    return response;
  }
}
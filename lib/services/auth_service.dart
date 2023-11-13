import 'dart:convert';
import 'dart:developer';
import 'package:demo_project/shared/constants/endpoints.dart';
import 'package:demo_project/shared/constants/environment.dart';
import 'package:http/http.dart' as http;

class AuthServices {

  Future<http.Response> login({
    required String code,
    required String phoneNumber,
    required String password,
  }) async {
    Map<String, dynamic> body = {
      "user": {
        "country_code": code,
        "phone_number": phoneNumber,
        "password": password,
      },
      "device": {
        "device_type": "android", //"android" , "ios" , "web", "unknown"
        "fcm_token": "{{fcm_token}}"
      }
    };
    Map<String, String>? headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Accept-Language": 'en',
    };
    final http.Response response = await http.post(
      Uri.parse('${Environment.baseUrl}${Endpoints.login}'),
      body: jsonEncode(body),
      headers: headers,
    );
    log(body.toString(),name: "LOGIN-BODY");
    log(response.body,name: "LOGIN-RESPONSE-BODY");
     return response;
    }

    

   // Logout service
   Future<http.Response> logout() async {
    Map<String, String>? headers = {
      "Content-type": "application/json",
      "Accept": "application/json",
      "Accept-Language": 'en',
    };
    final http.Response response = await http.delete(
        Uri.parse('${Environment.baseUrl}${Endpoints.logout}'),
        headers: headers,
        );
        // ignore: avoid_print
        print('response ${response.body}');
        return response;
        // print(response);
     }

     //verify authentication code
  Future<http.Response> verifyOtpServices({
    required String verificationCode,
    }) async {
    Map<String, String>? headers = {
      'Content-Type': 'application/json',
      'Accept-Language': 'en',
      'Timezone': 'Cairo',
    };
    final http.Response response = await http.post(
        Uri.parse('${Environment.baseUrl}${Endpoints.verifyCode}'),
        headers: headers
        );
        print(response);
        return response;
  }
  }   
    


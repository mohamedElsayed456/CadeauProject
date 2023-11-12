import 'package:flutter/material.dart';


class PhoneVerificationProvider extends ChangeNotifier{
  String? phoneNumber;
  String? verificationCode;
  bool isCodeSent = false ;

  //  Future<void> sendVerificationCode() async{
  //    final response = await http.post(
  //     Uri.parse(Environment.sendVerificationCode),
  //     body: {
  //       'phoneNumber': phoneNumber,
  //       },
  //       headers: {
  //         'Accept-Language': 'en',
  //          'Timezone': 'cairo'
  //       }
  //   );
  //    if (response.statusCode == 200) {
  //     isCodeSent = true;
  //     notifyListeners();
  //   }
  //  }

   
  // Future<void> verifyCode() async {
  //   final response = await http.post(
  //     Uri.parse(Environment.sendVerificationCode),
  //     body: {
  //       'phoneNumber': phoneNumber,
  //       'verificationCode': verificationCode,
  //       },
  //   );

  //   if (response.statusCode == 200) {
  //     // Code verification successful, do something
  //   } else {
  //     // Code verification failed, handle error
  //   }
  // }

    //
}
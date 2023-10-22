import 'package:flutter/material.dart';

class AppUrl{
  static const String baseUrl = 'http://3.65.222.77/api';
  static const String login = baseUrl +'/v1'+'/auth/customer/login';
  static const String forgotPassword = baseUrl +'/forgotPassword';
  static const String sendVerificationCode = baseUrl+'/v1'+'/auth/verification/send_verification_info';
}


void navigateTo (context,widget) => Navigator.push(
  context, MaterialPageRoute(builder:(context) => widget,
 ),
);

navigateandfinish (context,widget) => Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
       builder:(context) => widget,
       ),
       (Route<dynamic>route) => false,
     );

//  Widget otpnumber() =>
//   Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children:[
//       for(int i=0; i<6;i++)
//       Container(
//          width: 34,
//          height: 34,
//          margin:const EdgeInsets.symmetric(horizontal: 10) ,
//          decoration: BoxDecoration(
//          border: Border.all(color:Color.fromRGBO(26, 26, 26, 1)),
//         ),
//         child:myInputBox(),
//         ),
//     ],
//   );
  Widget myInputBox(TextEditingController controller,BuildContext context){
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        border: Border.all(color:const Color.fromRGBO(26, 26, 26, 1)),
       ),
        child: TextField(
          keyboardType: TextInputType.number,
          controller: controller,
          maxLength: 1,
          textAlign: TextAlign.center,
          decoration:const InputDecoration(
              counterText: '',
          ),
          onChanged: (value){
            if(value.length==1){
              FocusScope.of(context).nextFocus();
            }
          },
          style:const TextStyle(color: Colors.black,fontSize: 17),
        ),
    );
  }
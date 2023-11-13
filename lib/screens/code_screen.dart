import 'dart:async';
import 'package:demo_project/screens/new_password_screen.dart';
import 'package:demo_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


// ignore: must_be_immutable
class CodeScreen extends StatefulWidget {
  const CodeScreen({
    super.key,required this.phoneNumber,
    });
  final String phoneNumber;

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  int resendtime=60;
  late Timer countdownTimer;
  final TextEditingController pinController = TextEditingController();

  @override
  void initState(){
    startTimer();
    super.initState();
  }
  startTimer(){
    countdownTimer=Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        resendtime=resendtime-1;
      });
      if(resendtime<1){
        countdownTimer.cancel();
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(
           onPressed: () {
             Navigator.pop(context);
           },
          icon:const Icon(Icons.arrow_back_ios,size: 20,)
          ),
      ),
      body:Center(
        child: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 25.0),
         child: Column(
         children:[
          Padding(
           padding: const EdgeInsets.only(top:40),
           child: Column(
          children:[
        Image.asset('assets/images/code.png'),
          
        const SizedBox(height: 30,),
        const Text('Code',style: TextStyle(
        fontSize: 30,
        fontWeight:FontWeight.bold,
        ),
      ),
      const SizedBox(height: 10,),
        const Text(
          'We have sent the code to create \n Your account to mobile number',
        style: TextStyle(
        fontSize:18,
        color: Color.fromRGBO(26, 26, 26, 1)
          ),
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20,),
            Text(
              widget.phoneNumber,
            style:const TextStyle(
            fontSize:22,
            fontWeight: FontWeight.bold,
            color: Color.fromRGBO(26, 26, 26, 1),
              ),
              textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 30,),
               ///pin code textField
            PinCodeTextField(
              separatorBuilder: (context, index) => SizedBox(width:0,),
              appContext: context,
              length:6, // You can change the length of the pin code
              onChanged: (value) {

              },
              controller: pinController,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              animationDuration:const Duration(milliseconds: 200),
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(0),
                fieldHeight: 40,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedColor:const Color.fromRGBO(26, 26, 26, 1),
                inactiveColor: Colors.black38,
                //errorBorderColor: Color.fromRGBO(26, 26, 26, 1)
              ),
            ),   
               
  
           const SizedBox(height: 10,),
               resendtime==0? InkWell(
                child: Text('Resend code', style:TextStyle(
                    color: Colors.grey[400]
                 ),
                ),
               ):const SizedBox(),
               const SizedBox(height: 20,),
               resendtime!=0?Text('$resendtime s'):const SizedBox(),
              //next
              const SizedBox(height: 60,),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                onPressed: (){ 
                // final otp = txt1.text+txt2.text+txt3.text+txt4.text+txt5.text+txt6.text;

                  navigateTo(context,const NewPasswordScreen());
           
               },
              // ignore: sort_child_properties_last
              child:const Text(
                'Next',
                  style:TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                style:ElevatedButton.styleFrom(
                  shape:const BeveledRectangleBorder(),
                   // primary: loginProvider.isPhoneEnabled ? Colors.blue : Colors.grey[200],
                   backgroundColor:  Colors.grey[200],
                  ),
                ),
              ),
           
                ],
              ),
                  ),
                ],  
               ),
           ),
         ),
      );
   }
}
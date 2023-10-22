import 'package:country_code_picker/country_code_picker.dart';
import 'package:demo_project/providers/login_provider.dart';
import 'package:demo_project/screens/forget_password_screen.dart';
import 'package:demo_project/layout/home_layout.dart';
import 'package:demo_project/shared/components/components.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

 TextEditingController passwordController = TextEditingController();
 TextEditingController phoneController = TextEditingController();
 final formkey = GlobalKey<FormState>();
 bool _obsecuretext=true;
 String? _password;
 
  @override
  Widget build(BuildContext context){

   
    return Scaffold(
      appBar: AppBar(
        leading:const Icon(Icons.arrow_back_ios,size: 20,),
        actions: [
          IconButton(
            onPressed:(){
              navigateandfinish(context,  HomeLayoutScreen());
              } ,
               icon: Icon(Icons.home)
               ),
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<LoginProvider>(
          builder: (context, loginProvider, child) => Column(
            children: [
                   Column(
                 children:[
                  Image.asset('assets/images/logo.png'),
                  
                  const SizedBox(height: 30,),
                  const Text('Welcome back',style: TextStyle(
                    fontSize: 25,
                    fontWeight:FontWeight.bold,
                    ),
                    ),
                  const Text('Log in',style: TextStyle(
                    color:Colors.grey,
                    fontSize:20,
                    fontWeight: FontWeight.bold),
                    ),
                   ],
                  ),
              
                   const SizedBox(height: 20,),
                   
                   
                   Padding(
                     padding: const EdgeInsets.all(20.0),
                     child: Form(
                      key: formkey,
                       child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                         Text('Phone number',style: TextStyle(fontSize: 12, color:Colors.grey[600]),),
                        
                          Row(
                            children: [
                              Expanded(
                                child: CountryCodePicker(
                                  alignLeft: true,
                                  showFlag:false,
                                  onChanged: (value) =>loginProvider.updateCountryCode(value.toString()),
                                  // initialSelection: enteredcode,textStyle:const TextStyle(
                                  //   fontSize: 14,
                                  //   color: Colors.black,
                                  //   ),
                                  closeIcon:const Icon(Icons.backspace_sharp,color: Colors.grey,),
                                ),
                              ),
                              
                              Expanded(
                                flex: 3,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller:phoneController,
                                  onChanged: (String value) => loginProvider.updatePhoneNumber(value),
                                  validator: (value){
                                      if (value == null || value.isEmpty){
                                        return 'Please enter your phone number';
                                        }
                                        return null;
                                      },
                                  decoration:const InputDecoration(
                                
                                   hintText: '1274565461',
                                   hintStyle: TextStyle(
                                   color: Colors.grey,
                                   fontSize: 13,
                                   fontWeight: FontWeight.w300,
                                   ),
                                 ),
                                ),
                              ),
                            ],
                          ),
                           
                         Text('password',style: TextStyle(fontSize: 12, color:Colors.grey[600]),),
                           
                                      
                          //Enter your text here
                        TextFormField (
                          controller: passwordController,
                          onChanged:loginProvider.updatePassword,
                           
                           validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Please enter password';
                              }
                              return null;
                            },
                            onSaved:(Value) {
                              Value=_password;
                            },
                          decoration: InputDecoration(
                            hintText: 'Enter your passsword here',
                            hintStyle:const TextStyle(
                               color: Colors.grey,
                               fontSize: 13,
                               fontWeight: FontWeight.w300
                              ),
                             suffixIcon:GestureDetector(
                              onTap: (){
                                setState(() {
                                  _obsecuretext=!_obsecuretext;
                                });
                              },
                              child: Icon(
                                _obsecuretext?Icons.visibility:Icons.visibility_off,
                                color: Colors.grey[400],
                                ),
                             )
                            ),
                            obscureText: _obsecuretext,
                        ),
                        const SizedBox(height: 20,),
                        //login
                        SizedBox(
                          height: 56,
                          width: double.infinity,
                          child: ElevatedButton(
                          onPressed: ()async{
                          loginProvider.isButtonEnabled?(){
                        
                          }:null;
                          if(formkey.currentState!.validate()){
                          await loginProvider.userLogin(
                             loginProvider.code,
                             loginProvider.phoneNumber,
                             passwordController.text,
                             );
                            navigateandfinish(context,  HomeLayoutScreen());
                            Fluttertoast.showToast(
                              msg: 'Login Successfully',
                              backgroundColor: Colors.green,
                              );
                          };
                        },
                             child:Text(
                              'Log in',
                              style:TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                ),
                             ),
                             style:ElevatedButton.styleFrom(
                               shape:const BeveledRectangleBorder(),
                              primary: loginProvider.isButtonEnabled ? Colors.blue : Colors.grey[200],
                             ),
                            ),
                        ),
                        
                          Row(
                            children:[
                               const Spacer(),
                              TextButton(
                                onPressed: (){
                                  navigateTo(context, ForgotPasswordScreen());
                                },
                                 child:const Text(
                                  'Forget password ?',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12
                                   ),
                                ),
                              ),
                            ],
                           ),
                          ], 
                         ),
                     ),
                   ),
              
              
              
                      const SizedBox(height: 100,),
                      RichText(
                      text: TextSpan(
                      text:'You don’t have account ?',
                                 
                      style:const TextStyle(
                       color: Colors.black,
                          fontSize: 13,
                    ),
                       children: [
                      TextSpan(
                      text: ' Sign up',
                       style:const TextStyle(
                         fontSize: 15,
                         color: Colors.deepOrange
                       ),
                       recognizer: TapGestureRecognizer()
                        ..onTap=(){
                                        
                        }
                       ),
                     ]
                    ),
                  ),  
                ],
             ),
        ),
      ),
    );
    
  }
}

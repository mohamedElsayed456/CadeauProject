import 'package:country_code_picker/country_code_picker.dart';
import 'package:demo_project/providers/phone_verification_provider.dart';
import 'package:demo_project/repo/auth_repo.dart';
import 'package:demo_project/screens/code_screen.dart';
import 'package:demo_project/shared/components/components.dart';
import'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class ForgotPasswordScreen extends StatefulWidget{
   const ForgotPasswordScreen({super.key,});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  String selectedCountryCode = '+20';
  late final forgotVerificationProvider = context.read<PhoneVerificationProvider>();



  @override
  Widget build(BuildContext context){
    
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
           onPressed: () {
             Navigator.pop(context);
           },
          icon:const Icon(Icons.arrow_back_ios,size: 20,),
          ),
      ),
      body:SingleChildScrollView(
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.only(top:30),
                  child: Column(
                  children:[
                    Image.asset('assets/images/lock.png'),
                
                    const SizedBox(height: 30,),
                    const Text('Forget password',style: TextStyle(
                    fontSize: 25,
                    fontWeight:FontWeight.bold,
                   ),
                  ),
                  const SizedBox(height: 10,),
                     Text('Enter phone number to recieve \n code on it',style: TextStyle(
                    color:Colors.grey[400],
                    fontSize:11,
                    fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                 ],
                         ),
              ),  
              const SizedBox(height: 60,),  
                Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                key: formkey,
                child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:[
                  Text('Phone number',style: TextStyle(fontSize: 12, color:Colors.grey[600]),),
                                     
                Row(
                  children:[
                     Expanded(
                    child: CountryCodePicker(
                       onChanged: (CountryCode code) {
                      selectedCountryCode = code.dialCode ?? '';
                    },
                       showFlag:false,
                       alignLeft: true,
                       initialSelection: selectedCountryCode,
                       closeIcon:const Icon(Icons.backspace_sharp,color: Colors.grey,),
                        
                    ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        controller:phoneController,
                        onChanged: (value) {
                        
                          },
                     validator: (value){
                      if (value == null || value.isEmpty){
                        return 'Please enter your phone number';
                        }
                        return null;
                      },
                    decoration:const InputDecoration(
                     border: UnderlineInputBorder(),
                    hintText: 'Ex:1274565461',
                      hintStyle: TextStyle (
                      color: Colors.grey,
                      fontSize:14,
                      fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                )
              ],
            ),
              const SizedBox(height: 15,),
             SizedBox(
              height: 56,
              width: double.infinity,
              child:Selector<PhoneVerificationProvider, bool>(
                  selector: (ctx, provider) => provider.isloading,
                  builder: (context, isloading, _){
                  return  ElevatedButton(
                  onPressed: ()async{
                      isloading ? {} : sendCode();

                   },
                   style:ElevatedButton.styleFrom(
                      shape:const BeveledRectangleBorder(),
                       backgroundColor: Colors.grey[200],
                     ),
                  child:isloading
                    ?const CircularProgressIndicator(color:Colors.white,)
                    :const Text(
                      'Next',
                      style:TextStyle(
                       color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                   );
                  }
                  )
                 )
                ],
               ),
              ),
            ),       
          ], 
           ),
          ),
      );
     }

   Future<void>sendCode()async{
    if(formkey.currentState!.validate()){
       AuthRepo authRepo = AuthRepo();
     forgotVerificationProvider.setIsloading(true);
      // Validate phone number input
      String phoneNumber = phoneController.text.trim();
      String countryCode = selectedCountryCode;
      final success = await authRepo.sendCode(phoneNumber,countryCode);
      forgotVerificationProvider.setIsloading(false);
      if(success==success){
       // ignore:use_build_context_synchronously
       navigateTo(context,CodeScreen(phoneNumber: phoneNumber,countryCode: countryCode,));
      } else {
        
     }
    }  
   }
  }

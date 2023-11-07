import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
 final formkey = GlobalKey<FormState>();

 bool _obsecuretext = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       leading: IconButton(
           onPressed: () {
             Navigator.pop(context);
           },
          icon:const Icon(Icons.arrow_back_ios,size: 20,),
          ),
        ),
        body:Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Column(
                  children:[
                   Image.asset('assets/images/lock.png'),
              
                     const SizedBox(height: 30,),
                     const Text('Set New Password',style: TextStyle(
                       fontSize: 25,
                       fontWeight:FontWeight.bold,
                 ),
                ),
              ]
              ),
                 const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                  key: formkey,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                       Text('New Password',style: TextStyle(fontSize: 12, color:Colors.grey[600]),),
                           
                                      
            //Enter your text here
          TextFormField(                           
              validator:(value){
              if (value == null || value.isEmpty){
                return 'Enter at least 8 characters';
                }
                return null;
              },
            decoration: InputDecoration(
              hintText: 'Enter at least 8 characters',
              hintStyle:const TextStyle(
                  color: Colors.grey,
                  fontSize:13,
                  fontWeight: FontWeight.w300
                ),
                suffixIcon:GestureDetector(
                onTap:(){
                    setState((){
                    _obsecuretext=!_obsecuretext;
                  });
                },
                child:Icon(
                  _obsecuretext?Icons.visibility:Icons.visibility_off,
                  color: Colors.grey[400],
                  ),
                )
              ),
              obscureText: _obsecuretext,
            ),

            const SizedBox(height: 40,),
              SizedBox(
                height: 56,
                width: double.infinity,
                child: ElevatedButton(
                onPressed: (){
           
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
                ),  
             ]
            ),
           ),
        )
    );
  }
}
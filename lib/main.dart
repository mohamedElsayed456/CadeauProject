//https://github.com/mohamedElsayed456/CadeauProject.git
import 'package:demo_project/providers/login_provider.dart';
import 'package:demo_project/providers/logout_provider.dart';
import 'package:demo_project/providers/occasions_provider.dart';
import 'package:demo_project/providers/phone_verification_provider.dart';
import 'package:demo_project/providers/products_details_provider.dart';
import 'package:demo_project/providers/products_provider.dart';
import 'package:demo_project/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>LoginProvider()),
        ChangeNotifierProvider(create: (_)=>PhoneVerificationProvider()),
        ChangeNotifierProvider(create: (_)=>OccasionsProvider()),
        ChangeNotifierProvider(create: (_)=>ProductsProvider()),
        ChangeNotifierProvider(create: (_)=>ProductsDetailsProvider()),
        ChangeNotifierProvider(create: (_)=>LogoutProvider()),

      ],
      builder: (context,child){
        
        return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3:true,
        ),
       home: ChangeNotifierProvider(
          create: (context) => LoginProvider(),
          child:const LoginScreen(),
        ),
        routes: {
          '/login': (context) =>const LoginScreen(),
        },
      );
     }
    );
  }
}
    


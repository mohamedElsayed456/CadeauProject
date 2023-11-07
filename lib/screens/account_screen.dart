import 'package:demo_project/screens/login_screen.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget{
  const AccountScreen({super.key});

@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:AppBar(
        title:const Text('Account',style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions:const[
              Padding(
                 padding: EdgeInsets.all(10.0),
                 child: Icon(Icons.notifications_none),
               ),
              ],
        ),
      body:Padding(
        padding: const EdgeInsets.all(10.0),
        child: InkWell(
           onTap:(){
               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>const LoginScreen()));
           } ,
          child:const Row(
            children:[
              Icon(Icons.logout_outlined,size: 30,),
              SizedBox(width: 10),
              Text('Log Out',style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500,))
            ],
          ),
        ),
      ),
    );
  }
}
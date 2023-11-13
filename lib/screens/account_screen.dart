import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget{
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen>{

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
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
           onTap:()async{
            await logout(context);
           },
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

  Future<void> logout(BuildContext context) async {
    // Clear user authentication state (using shared_preferences for example)
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();

    // Navigate to the login screen
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, '/login');
  }
}






import 'package:flutter/material.dart';

class Shopping extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Shopping',style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions:const[
              Padding(
                 padding: EdgeInsets.all(10.0),
                 child: Icon(Icons.notifications_none),
               ),
              ],
        ),
      body:const Center(
      child:Text(
        'Shopping Screen',
        style: TextStyle(
          color: Colors.black,fontSize: 40,fontWeight: FontWeight.bold
          ),
        ),
       )
      );
  }
}
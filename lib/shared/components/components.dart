import 'package:flutter/material.dart';

void navigateTo (context,widget) => Navigator.push(
  context, MaterialPageRoute(builder:(context) => widget,
 ),
);

navigateandfinish (context,widget) => Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
       builder:(context) => widget,
       ),
       (Route<dynamic>route) => false,
     );

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

  
  Widget getLoadingUi(){
    return const Center(
      child:Column(
        mainAxisSize: MainAxisSize.min,
        children:[
          CircularProgressIndicator(color: Colors.grey,strokeWidth:2,),
          SizedBox(height: 15,),
          //Text('Loading...',),
        ],
      ),
    );
  }

  Widget getErrorUi(String error){
    return Center(
      child: Text(error,style:const TextStyle(fontSize: 22,color: Colors.red),),
    );
  }

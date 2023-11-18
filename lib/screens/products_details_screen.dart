import 'package:demo_project/models/products_details_model.dart';
import 'package:demo_project/providers/products_details_provider.dart';
import 'package:demo_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class ProductsDetailsScreen extends StatefulWidget{
  const ProductsDetailsScreen({super.key,required this.id,});

  final int id;
  @override
  State<ProductsDetailsScreen> createState()=>_ProductsDetailsScreenState();
 }
 class _ProductsDetailsScreenState extends State<ProductsDetailsScreen>{
   @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProductsDetailsProvider>(context, listen: false)
          .productDetailsProvider(widget.id);
    });
  }

  @override
  Widget build(BuildContext context){
     return Scaffold(

    body:Selector<ProductsDetailsProvider,bool>(
        selector:(context, provider) =>provider.isloading,
          builder:(context, isloading, _)=> isloading?getLoadingUi()
       :Selector<ProductsDetailsProvider,ProductsDetailsModel>(
        selector:(context, provider) =>provider.product,
        builder:(context, model, _){
        return SingleChildScrollView(
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children:[
               Stack(
                alignment: Alignment.topLeft,
                 children:[ 
                  SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(model.image.toString(),fit: BoxFit.fill,),
                  ),
                   Row(
                    children: [
                      Padding(
                        padding:const EdgeInsets.symmetric(horizontal:30,vertical:40 ),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: IconButton(
                             onPressed: () {
                               Navigator.pop(context);
                             },
                            icon:const Icon(Icons.arrow_back_ios_rounded,size: 15,color:Colors.black,)
                            ),
                          ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding:EdgeInsets.symmetric(horizontal:30,vertical:40 ),
                        child:CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.white,
                          child: Icon(Icons.share,size: 15,color:Colors.black,)
                        ),
                      ), 
                    ],
                  )
                 ], 
               ),
              const SizedBox(height: 15,),
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal:20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(
                      model.name.toString(),
                      style:const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                     ),
                     const SizedBox(height: 15,),
                     Row(
                      children:[
                      Text(
                        'SAR ${model.priceAfterDiscount.toString()}',
                        style:const TextStyle(
                        color: Color.fromRGBO(26,26,26,1),
                        fontSize:20,
                        fontWeight:FontWeight.bold,
                      ),
                      ),
                      const SizedBox(width: 3,),
                      Text(
                          'SAR ${model.price.toString()}',
                          style:const TextStyle(
                        color: Color.fromRGBO(197, 197, 197, 1),
                          decoration: TextDecoration.lineThrough,
                          fontSize: 17,
                        ),
                      )
                      ],
                    ),
                   const SizedBox(height: 40,),

                  const Text(
                     'Descreption',
                 style:TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500
                  ),
                  ),
                 Text(
                  model.description.toString(),
                  style:const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black45,
                  //color: Color.fromRGBO(82, 82, 82, 1),
                  ),
                ),
               ],
              ),
           ),   
          ],
        ),
        );
    }
   )
  )
 );
 }
}

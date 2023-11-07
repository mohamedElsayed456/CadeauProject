import 'package:demo_project/models/products_details_model.dart';
import 'package:demo_project/providers/products_details_provider.dart';
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
    final provider = Provider.of<ProductsDetailsProvider>(context,listen:false);
    provider.getProductsDetailsData(widget.id);  
    super.initState();
  }

  @override
  Widget build(BuildContext context){
     return Consumer<ProductsDetailsProvider>(
       builder:(context,provider,child) => Scaffold(

        body:provider.isloading?getLoadingUi()
         :provider.error.isNotEmpty?getErrorUi(provider.error)
         :getBodyUi(provider.show),
      
       ),
     );
  }

  Widget getLoadingUi(){
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child:Column(
          mainAxisSize:MainAxisSize.min,
          children:[
            CircularProgressIndicator(color: Colors.grey,),
            SizedBox(height: 15,),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }

  Widget getErrorUi(String error){
    return Center(
      child:Text(
        error,style:const TextStyle(fontSize: 22,color: Colors.red),
      ),
    );
  }

  Widget getBodyUi(ProductsdetailsModel model){
    return const Center(
      child: Text('mohamed'),
      );
     } 
  }
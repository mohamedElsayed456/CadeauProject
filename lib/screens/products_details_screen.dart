import 'package:demo_project/models/products_details_model.dart';
import 'package:demo_project/providers/products_details_provider.dart';
import 'package:demo_project/repo/products_details_repo.dart';
import 'package:demo_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';


// ignore: must_be_immutable
class ProductsDetailsScreen extends StatefulWidget{
  const ProductsDetailsScreen({super.key,required this.id,});

  final int id;
  @override
  State<ProductsDetailsScreen> createState()=>_ProductsDetailsScreenState();
 }
 class _ProductsDetailsScreenState extends State<ProductsDetailsScreen>{
    late final productDetailsProvider = context.read<ProductsDetailsProvider>();

   @override
  void initState(){
    super.initState();
   _productDetails();
  }

  @override
  Widget build(BuildContext context){
     return Scaffold(

    body:Selector<ProductsDetailsProvider,Tuple2<bool,ProductsDetailsModel>>(
      selector:(context, provider) =>Tuple2(provider.isloading, provider.product),
        builder:(context,loadingandList, _){

          final isLoading = loadingandList.item1;
          final model = loadingandList.item2;

          if(isLoading){
            return getLoadingUi();
          }
          else{
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
    }
   )
  );
 }
    Future<void> _productDetails() async {
    ProductsDetailsRepo productDetailsRepo = ProductsDetailsRepo();
    productDetailsProvider.setIsloading(true);
    ProductsDetailsModel? productDetails = (await productDetailsRepo.getProductsDetails(widget.id));
    if (productDetails != null) {
      // ignore: use_build_context_synchronously
      context.read<ProductsDetailsProvider>().updateProductDetails(productDetails);

      productDetailsProvider.setIsloading(false);
  }
}
}

import 'package:demo_project/models/products_model.dart';
import 'package:demo_project/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Products extends StatefulWidget{
  const Products({super.key,required this.id});

    final int id;

  @override
  State<Products> createState()=>_OccasionState();
 }
 class _OccasionState extends State<Products>{
   @override
  void initState(){
    final provider = Provider.of<ProductsProvider>(context,listen:false);
    provider.getProductsData(widget.id);  
    super.initState();
  }

  @override
  Widget build(BuildContext context){
     return Scaffold(
     appBar: AppBar(
       title:const Text(
         'products',
         style: TextStyle(fontWeight: FontWeight.w500),
         ),
       centerTitle: true,
       actions:[
         IconButton(onPressed:(){}, icon:const Icon(Icons.search)),
       ],
       ),
     
     body:Consumer<ProductsProvider>(
       builder:(context,provider, child) =>provider.isloading?getLoadingUi()
         :provider.error.isNotEmpty?getErrorUi(provider.error)
         :getBodyUi(provider.product),
      
       ),
     );
  }

  Widget getLoadingUi(){
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
      child: Text(error,style:const TextStyle(fontSize: 22,color: Colors.red),),
    );
  }

  Widget getBodyUi(ProductsModel model){
    return  GridView.builder(
      itemCount: model.data.products.length,
      gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio:  3/2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            ),
      itemBuilder:(context, index){
        return Column(
          children: [
            SizedBox(
              width: 222.6,
              height: 167,
              child: Image.network(model.data.products[index].image),
              ),
              const Icon(Icons.access_alarm,color:Colors.amber),
             Text(
              model.data.products[index].name,
              style:const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
             ),
            ),
            Row(
              children:[
                Text(
                  model.data.products[index].currency.name.toString() +
                  model.data.products[index].priceAfterDiscount.toString(),
                  
                style:const TextStyle(
                  color: Color.fromRGBO(26, 26, 26, 1),
                  fontSize: 18,
                ),
                ),
                
                Text(
                  model.data.products[index].currency.lookupKey.toString() +
                  model.data.products[index].price.toString(),
                   style:const TextStyle(
                  color: Color.fromRGBO(197, 197, 197, 1),
                   decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
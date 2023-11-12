//https://youtu.be/oXcslhSZiVo
//https://youtu.be/M0Gs1aJniv0?si=yENGp6R3FJ5lW_Nw
import 'package:demo_project/models/products_model.dart';
import 'package:demo_project/providers/products_provider.dart';
import 'package:demo_project/screens/products_details_screen.dart';
import 'package:demo_project/shared/components/components.dart';
import 'package:demo_project/widgets/top_offer_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: must_be_immutable
class ProductsScreen extends StatefulWidget{
  const ProductsScreen({super.key,required this.id,required this.title});

  final String title;
  final int id;

  @override
  State<ProductsScreen> createState()=>_ProductsScreenState();
 }
 class _ProductsScreenState extends State<ProductsScreen>{
   @override
  void initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp){
      Provider.of<ProductsProvider>(context, listen: false).productListProvider(widget.id);
    });
  }

  @override
  Widget build(BuildContext context){
    final provider = Provider.of<ProductsProvider>(context);
     return Scaffold(
      appBar: AppBar(
      title:Text(
         widget.title,
       style:const TextStyle(fontWeight: FontWeight.w500),
       ),
      centerTitle:true,
      actions:[
       IconButton(onPressed:(){},icon:const Icon(Icons.search)),
     ],
     ),
     
     body:provider.isLoading?getLoadingUi():
       Selector<ProductsProvider,List<ProductsModel>>(
        selector: (context, provider) => provider.proModel,
        builder:(context, model, _) =>Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children:[
          Expanded(
             child: TopOfferContainer(title:widget.title),
          ),
          
          const SizedBox(height: 40,),

           Expanded(
            flex:7,
            child: GridView.builder(
              itemCount: model.length,
              gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 300,
                    crossAxisSpacing:4,
                    mainAxisSpacing:2,
                    ),
              itemBuilder:(context,index){
                   return InkWell(
                    onTap: (){
                       navigateTo(context, ProductsDetailsScreen(id:model[index].id!));
                    },
                     child: Padding(
                       padding: const EdgeInsets.all(2.0),
                       child: Column(
                        mainAxisSize:MainAxisSize.min,
                        crossAxisAlignment:CrossAxisAlignment.start,
                          children:[
                            SizedBox(
                              width: double.infinity,
                              height: 168,
                              child: Image.network(
                                model[index].image!,
                                fit: BoxFit.fill,
                                ),
                              ),
                              
                             AutoSizeText(
                              model[index].name!,
                              maxLines:4,
                              maxFontSize:14,
                              style:const TextStyle(
                              color: Color.fromRGBO(26, 26, 26, 1),
                              fontWeight: FontWeight.w400,
                             ),
                            ),
                            const SizedBox(height: 3,),
                            SizedBox(
                              width:double.infinity,
                              child: Row(
                                children:[
                                  Text(
                                   'SAR ${model[index].priceAfterDiscount.toString()}',
                                    style:const TextStyle(
                                    color: Color.fromRGBO(26, 26, 26, 1),
                                    fontSize:16,
                                    fontWeight: FontWeight.bold
                                  ),
                                  ),
                                  const SizedBox(width: 3,),
                                  Text(
                                     'SAR ${model[index].price.toString()}',
                                     style:const TextStyle(
                                    color: Color.fromRGBO(197, 197, 197, 1),
                                     decoration: TextDecoration.lineThrough,
                                     fontSize: 12,
                                   ),
                                  )
                                 ],
                               ),
                             ),
                           ]
                        ),
                      ),
                    );
                  }
                ),
          ),
         ],
        ),
       ),
      ),
     );
     } 
  }
import 'package:demo_project/models/occasion_model.dart';
import 'package:demo_project/providers/occasions_provider.dart';
import 'package:demo_project/shared/components/components.dart';
import 'package:demo_project/widgets/products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Occasion extends StatefulWidget{
   Occasion({super.key,required this.model});
List<OccasionsModel>model;

  @override
  State<Occasion> createState() => _OccasionState();
 }
 class _OccasionState extends State<Occasion>{
   @override
  void initState(){ 
    final provider = Provider.of<OccasionsProvider>(context,listen:false);
    provider.getoccasiondata();  
    super.initState();
  }
    

  @override
  Widget build(BuildContext context){
    final provider = Provider.of<OccasionsProvider>(context);
 
     return Scaffold(
      appBar: AppBar(
        title:const Text('Occasions',style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions:const[
          Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.notifications_none),
            ),
          ],
        ),
      body: provider.isloading?getLoadingUi()
          :provider.error.isNotEmpty?getErrorUi(provider.error)
          :getBodyUi(provider.model),
    );
  
  }

  Widget getLoadingUi(){
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: Colors.grey,),
          SizedBox(height: 15,),
          Text('Loading...'),
        ],
      ),
    );
  }

  Widget getErrorUi(String error){
    return Center(
      child: Text(error,style:const TextStyle(fontSize: 22,color: Colors.red),),
    );
  }

  Widget getBodyUi(OccasionsModel model){
    
    return Padding(
      padding:const EdgeInsets.all(10),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) =>const SizedBox(height: 5,),
        itemCount:model.data.occasionTypes.length,
        itemBuilder:(context, index){
          return Stack(
            alignment: Alignment.centerLeft,
            children:[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(5),
                  ),
                child:Image.network(model.data.occasionTypes[index].banner),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:80,left: 15,right: 15),
                  child: Column(
                    children:[
                      Row(
                        children:[
                         SizedBox(
                          width: 40,
                          height: 50,
                          child: Image.network(model.data.occasionTypes[index].icon)
                          ),
                         const SizedBox(width: 10,),
                         Text(
                          model.data.occasionTypes[index].name,
                          style:const TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontWeight: FontWeight.w500
                          ),
                          )
                        ],
                      ),
                      const SizedBox(height: 15,),
                       Row(
                        children: [
                           SizedBox(
                            width: 170,
                             child: Text(
                              model.data.occasionTypes[index].description.toString(),
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              maxLines: 2,
                              style:const TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(255, 255, 255, 1),
                              fontWeight: FontWeight.bold
                              ),
                            ),
                           ),

                        const Spacer(),

                        Container(
                          height: 30,
                          width: 90,
                          decoration:BoxDecoration(
                             color:const Color.fromRGBO(242, 85, 0, 1),
                              borderRadius: BorderRadius.circular(8),
                           ),

                          child: TextButton(
                           onPressed:(){
                              navigateTo(context,Products(id:model.data.occasionTypes[index].id));
                            },
                             child:const Text(
                              'View',
                              style: TextStyle(
                                color:Color.fromRGBO(255, 255, 255, 1),
                                fontSize: 13,
                                ),
                              ),
                             ),
                           ),
                        ],
                      ),
                    ],
                  ),
                ),
             ],
          );
        
      },
       ),
    );
  }
}
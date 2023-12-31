import 'package:demo_project/models/occasion_model.dart';
import 'package:demo_project/providers/occasions_provider.dart';
import 'package:demo_project/repo/occasion_repo.dart';
import 'package:demo_project/screens/products_screen.dart';
import 'package:demo_project/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

class OccasionScreen extends StatefulWidget{
  const OccasionScreen({super.key});

  @override
  State<OccasionScreen> createState() => _OccasionScreenState();
}

class _OccasionScreenState extends State<OccasionScreen> {

  late final occasionProvider = context.read<OccasionsProvider>();

 @override
  void initState(){
    super.initState();
    _occasionList();
  }

   @override
  Widget build(BuildContext context){
     return Scaffold(
      appBar:AppBar(
        title:const Text('Occasions',style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions:const[
          Padding(
              padding:EdgeInsets.all(10.0),
              child:Icon(Icons.notifications_none),
            ),
          ],
        ),
          
      body:Selector<OccasionsProvider,Tuple2<bool,List<OccasionsModel>>>(
        selector:(context, provider) =>Tuple2(provider.isloading,provider.occModel),
          builder:(context,loadingandList, _){
              final isLoading = loadingandList.item1;
              final model = loadingandList.item2;

              if(isLoading){
                return getLoadingUi();
              }
              else{
                return Padding (
            padding: const EdgeInsets.all(13.0),
            child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount:model.length,
                   separatorBuilder: (context, index) => const SizedBox(height: 15,),
                  itemBuilder:(context,index){
                   return Container(
                    decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10)
                          ),
                     child: Stack(
                      alignment:Alignment.centerLeft,
                      children:[
                        Container(
                          width: double.infinity,
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(10)
                          ),
                           child:Image.network(model[index].banner.toString(),
                           fit:BoxFit.fill,
                           ),
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
                              child: Image.network(model[index].icon.toString())
                              ),
                              const SizedBox(width: 10,),
                              Text(
                                model[index].name.toString(),
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
                                model[index].description.toString(),
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
                                      navigateTo(
                                        context,ProductsScreen(
                                        id:model[index].id!,
                                        title: model[index].name.toString(),
                                        )
                                        );
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
                                 ),
                   );
              },
            ),
          );
         }
       }
      )
      );
    }

  Future<void>_occasionList()async{
    OccasionRepo occasionRepo =OccasionRepo();
    occasionProvider.setIsloading(true);
    List<OccasionsModel>? model =await occasionRepo.occasion();

    // ignore: use_build_context_synchronously
    context.read<OccasionsProvider>().updateOccasionList(model??[]);
    occasionProvider.setIsloading(false);
  }
}


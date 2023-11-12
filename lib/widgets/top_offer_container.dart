import 'package:flutter/material.dart';

class TopOfferContainer extends StatelessWidget {
  const TopOfferContainer({super.key,required this.title});

  final String title;

  @override
  Widget build(BuildContext context){
    return Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  
                  children: [
                   Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                    border: Border.all(color:const Color.fromRGBO(242, 85, 0, 1)),
                  ),
                    child:const Icon(
                      Icons.shape_line_outlined,
                      color:Color.fromRGBO(242, 85, 0, 1),
                      size: 15,
                      ),
                    ),
             
                   const SizedBox(width: 10,),

                     Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Top offers for $title',
                          style:const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold
                            ),
                            ),
                        const SizedBox(height: 5,),
                        Text(
                          'Discover top offers for $title and save money',
                           style:const TextStyle(
                            fontSize: 8,
                            color: Color.fromRGBO(26, 26, 26,1)
                            ),
                          ),
                      ],
                    ),
                      const SizedBox(width: 30,),

                     const Icon(Icons.arrow_forward_ios,size:19,)
                  ],
                ),
              ),
             );
  }
}
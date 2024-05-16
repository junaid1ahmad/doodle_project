import 'package:doodle_project/modules/models/business_list_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/app_pages.dart';

class RowBusinessList extends StatelessWidget{
  const RowBusinessList({super.key, required this.model});
final Businesses? model;
  @override
  Widget build(BuildContext context) {
   return InkWell(
     onTap: (){
       Get.offAllNamed(Routes.DETAILS);
     },
     child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
       children: [
         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Image.network(
               '${model?.imageUrl}',
               width: 150,
               height: 150,
               fit: BoxFit.cover,
             ),
           ),
         ),

         Expanded(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   '${model?.name}',
                   style: const TextStyle(
                     fontSize: 18,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 const SizedBox(height: 10),
                 Text(
                   '${model?.location?.displayAddress}',
                   style: const TextStyle(fontSize: 18),
                 ),
               ],
             ),
           ),
         ),
         // Right side with image

       ],
     ),
   );
  }

}
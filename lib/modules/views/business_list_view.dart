import 'package:doodle_project/modules/controller/business_list_controller.dart';
import 'package:doodle_project/modules/widgets/row_business_list.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class BusinessListView extends GetView<BusinessListController>{
  const BusinessListView({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(body: SafeArea(child: Obx((){
      if(controller.businessLoading.value){
        return const SizedBox();
      }
      return ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return  RowBusinessList(model: controller.businessListResponse.value?.businesses![index],);
          });
    })));
  }

}
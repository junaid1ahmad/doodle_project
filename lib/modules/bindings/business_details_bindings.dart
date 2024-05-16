import 'package:get/get.dart';

import '../controller/business_details_controller.dart';

class BusinessDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessDetailsController>(() => BusinessDetailsController());
  }
}

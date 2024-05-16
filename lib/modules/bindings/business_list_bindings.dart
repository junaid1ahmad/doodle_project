import 'package:doodle_project/modules/controller/business_list_controller.dart';
import 'package:get/get.dart';

class BusinessListBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BusinessListController>(() => BusinessListController());
  }
}

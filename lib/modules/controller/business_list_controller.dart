import 'package:doodle_project/modules/models/business_list_model.dart';
import 'package:doodle_project/modules/repositories/business_list_repo.dart';
import 'package:get/get.dart';

class BusinessListController extends GetxController{
final businessRepo = BusinessListRepoImpl();
final businessListResponse = Rxn<BusinessListModel>();
final RxBool businessLoading =true.obs;
@override
  void onInit() async{
  businessListResponse.value = await businessRepo.getBusinessList();
  businessLoading.value= false;
    super.onInit();
  }


}
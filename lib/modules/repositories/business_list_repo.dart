import 'dart:convert';
import 'package:doodle_project/core/api_services/http_client.dart';
import 'package:get/get.dart';
import '../../core/api_services/apis.dart';
import '../models/business_list_model.dart';
import 'package:http/http.dart' as http;

abstract class BusinessListRepo {
  Future<BusinessListModel?> getBusinessList();
}

class BusinessListRepoImpl implements BusinessListRepo {
  @override
  Future<BusinessListModel?> getBusinessList() async {
    try {
      const urlEndPoint = Urls.getBusinessList;
      final services = ApiServicesImpl();
      final http.Response response =
          await services.getRequest(urlEndpoint: urlEndPoint);
      if (response.statusCode == 200) {
        String res = response.body;
        return BusinessListModel.fromJson(jsonDecode(res));
      }
    } catch (e) {
      e.printError();
    }
    return null;
  }
}

// ignore_for_file: constant_identifier_names
import 'package:doodle_project/modules/bindings/business_details_bindings.dart';
import 'package:doodle_project/modules/bindings/business_list_bindings.dart';
import 'package:doodle_project/modules/views/business_detail_view.dart';
import 'package:get/get.dart';
import '../modules/views/business_list_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const BusinessListView(),
      binding: BusinessListBindings(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => const BusinessDetailView(),
      binding: BusinessDetailsBindings(),
    ),
  ];
}

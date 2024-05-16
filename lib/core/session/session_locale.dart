import 'dart:ui';

import 'package:get/get.dart';

import '../shared_preference/shared_prefrence.dart';



class SessionLocale{
  SessionLocale._();
  static initCurrentLocale()async{
    Get.updateLocale(currentLocale);
  }

  static changeLocale(Locale locale) async{
    await MySharedPrefrence().setLocale(locale);
    await initCurrentLocale();

  }
  static Locale currentLocale = const Locale('en','US');

}
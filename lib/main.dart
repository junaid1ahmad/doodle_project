import 'dart:io';

import 'package:doodle_project/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

BuildContext? appcontext;
bool isTimeout = false;
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Yelp Demo',
      getPages: AppPages.routes,
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      )
    );
  }
}

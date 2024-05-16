import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';
import '../controller/business_details_controller.dart';

class BusinessDetailView extends GetView<BusinessDetailsController> {
  const BusinessDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvoked: (didPop) {
          Get.offAllNamed(Routes.SPLASH_SCREEN);
        },
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Get.offNamed(Routes.SPLASH_SCREEN),
              ),
              title: const Text('Business Details'),
              centerTitle: false,
            ),
            backgroundColor: Colors.white,
            body: const SizedBox()));
  }
}

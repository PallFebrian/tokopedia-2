// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/app/modules/produk/controllers/produk_controller.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  TextEditingController signOut = TextEditingController();
  @override
  void onInit() {
    PController().filterData();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}

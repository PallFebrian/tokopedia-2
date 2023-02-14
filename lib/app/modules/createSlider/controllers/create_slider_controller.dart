import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateSliderController extends GetxController {
 final aktifasi = true.obs;
  changeActivation() => aktifasi.toggle();

  TextEditingController desc = TextEditingController();
  TextEditingController gambar = TextEditingController();
  final count = 0.obs;
  @override
  void onInit() {
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

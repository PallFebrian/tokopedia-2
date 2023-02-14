import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateDataController extends GetxController {
  final aktifasi = true.obs;
  final data = Get.arguments;
  changeActivation() => aktifasi.toggle();

  TextEditingController desc = TextEditingController();
  TextEditingController gambar = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    gambar.text = (data.data() as Map<String, dynamic>)['gambarSlider'];
    desc.text = (data.data() as Map<String, dynamic>)['deskSlider'];
    aktifasi.value = (data.data() as Map<String, dynamic>)['aktifSlider'];
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

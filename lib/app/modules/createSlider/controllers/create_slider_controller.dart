import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';

class CreateSliderController extends GetxController {
 final aktifasi = true.obs;
  changeActivation() => aktifasi.toggle();

  TextEditingController desc = TextEditingController();
  TextEditingController gambar = TextEditingController();

  uploadGambar()async{
    final data = await SliderController().addPhoto();
    // ignore: avoid_print
    print(data);
  }
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

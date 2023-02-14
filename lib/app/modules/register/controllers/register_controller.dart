// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {

  final visibilityPassword = false.obs;
  changeEye() => visibilityPassword.toggle();

  TextEditingController email = TextEditingController();
  TextEditingController mobilePhone = TextEditingController();
  TextEditingController password = TextEditingController();

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

import 'package:get/get.dart';

import '../controllers/login_phone_number_controller.dart';

class LoginPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPhoneNumberController>(
      () => LoginPhoneNumberController(),
    );
  }
}

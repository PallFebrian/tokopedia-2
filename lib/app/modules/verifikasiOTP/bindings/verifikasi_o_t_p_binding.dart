import 'package:get/get.dart';

import '../controllers/verifikasi_o_t_p_controller.dart';

class VerifikasiOTPBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VerifikasiOTPController>(
      () => VerifikasiOTPController(),
    );
  }
}

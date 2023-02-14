import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/verifikasi_o_t_p_controller.dart';

class VerifikasiOTPView extends GetView<VerifikasiOTPController> {
  // final controller = Get.put(ForgotPasswordController());
  final authControllerController = Get.put(AuthControllerController());

 
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    final defaultPinTheme = PinTheme( 
      width: 56, 
      height: 56, 
      textStyle: TextStyle( 
          fontSize: 20, 
          color: Color.fromRGBO(30, 60, 87, 1), 
          fontWeight: FontWeight.w600), 
      decoration: BoxDecoration( 
        border: Border.all(color: Color.fromARGB(255, 107, 165, 212)), 
        borderRadius: BorderRadius.circular(20), 
      ), 
    ); 
 
    final focusedPinTheme = defaultPinTheme.copyDecorationWith( 
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)), 
      borderRadius: BorderRadius.circular(8), 
    ); 
 
    final submittedPinTheme = defaultPinTheme.copyWith( 
      decoration: defaultPinTheme.decoration?.copyWith( 
        color: Color.fromRGBO(234, 239, 243, 1), 
      ), 
    );

    return SafeArea(
      child: Scaffold(
        body: Container(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.fromLTRB(25, 70, 25, 40),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      // ignore: prefer_const_constructors
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: const IntrinsicWidth(
                              child: Text(
                            'Verification',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.w600),
                          ))),
                    ),
                    Container(
                      // width: 400,
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 25),
                      child: Text(
                          'Enter the phone number associated with your account and we`ll send an message with instructions ',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: abuAbu)),
                    ),
                    Padding( 
            padding: const EdgeInsets.all(30.0), 
            child: Pinput( 
              onSubmitted: (pin) => authControllerController.checkOTP(pin),
              length: 6, 
              defaultPinTheme: defaultPinTheme, 
              focusedPinTheme: focusedPinTheme, 
              submittedPinTheme: submittedPinTheme, 
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit, 
              showCursor: true, 
              // ignore: avoid_print 
              onCompleted: (pin) => authControllerController.checkOTP(pin), 
            ), 
          ),
                    Container(
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.VERIFIKASI_O_T_P),
                        child: Container(
                          margin: const EdgeInsets.only(top: 50),
                          width: lebar,
                          height: 55,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: bgLogin2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              const Text(
                                'Send',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

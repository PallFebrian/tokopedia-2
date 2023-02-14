// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/login_phone_number_controller.dart';

class LoginPhoneNumberView extends GetView<LoginPhoneNumberController> {
  // final controller = Get.put(ForgotPasswordController());
  final authControllerController = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
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
                            'Phone Number',
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
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Phone Number',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: TextField(
                              controller: controller.phone,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                    hintText: "Enter Your Mobile Phone",
                                    prefixIcon: Container(
                                      width: lebar * 0.13,
                                      child: Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  10, 5, 10, 5),
                                              child: Text(
                                                "+62",
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    color: subjudul),
                                              )),
                                          Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 5, 0, 5),
                                              height: tinggi * 0.04,
                                              child: VerticalDivider(
                                                color: subjudul,
                                                width: 2,
                                              ))
                                        ],
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)))),
                          ),
                          Container(
                            child: InkWell(
                              onTap: () => authControllerController.verifyPhone(controller.phone.text),
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
                                      'Send OTP',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final controller = Get.put(RegisterController());
    final authC = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 10, 30, 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: EdgeInsets.fromLTRB(left, top, right, bottom),
                    height: tinggi * 0.85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 0),
                          child: IconButton(
                            onPressed: () => Get.toNamed("/login"),
                            icon: Icon(Icons.arrow_back),
                            iconSize: 24,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(),
                          child: Text(
                            "Create Account",
                            style: TextStyle(fontSize: 25, color: judul),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 50, top: 10),
                          child: Text(
                            "Connect with your friends today!",
                            style: TextStyle(fontSize: 15, color: subjudul),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Email Address",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15, bottom: 15),
                          child: TextField(
                              controller: controller.email,
                            decoration: InputDecoration(
                                labelText: "Enter Your Email",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: border),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            "Mobile Phone",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: TextField(
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
                                            margin:
                                                EdgeInsets.fromLTRB(0, 5, 0, 5),
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
                        Text(
                          "Password",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: TextField(
                              
                            controller: controller.password,
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            obscureText: controller.visibilityPassword.value ? false : true,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () => controller.changeEye(),
                                  icon: Icon(
                                    controller.visibilityPassword.value
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black,
                                  ),
                                ),
                                labelText: "Enter Your Password",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: border),
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 40),
                          width: lebar,
                          height: 60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: bgLogin2),
                              onPressed: () => authC.register(controller.email.text,
                                controller.password.text),
                              child: Text(
                                "Sign Up",
                                style: TextStyle(fontSize: 18),
                              )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                child: Divider(
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                "Or Login With",
                                style: TextStyle(fontSize: 15, color: subjudul),
                              ),
                              Container(
                                width: 100,
                                child: Divider(
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: lebar * 0.35,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Image.asset("image/Facebook.png"),
                                        Text(
                                          "Facebook",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        )
                                      ],
                                    )),
                              ),
                              Container(
                                width: lebar * 0.35,
                                height: 50,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white),
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Image.asset("image/Google.png"),
                                        Text(
                                          "Facebook",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black),
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Dont`have an account?",
                            style: TextStyle(color: subjudul),
                          )),
                      TextButton(
                          onPressed: () => Get.toNamed("/login"),
                          child: Text(
                            "Login",
                            style: TextStyle(color: bgLogin2),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final controller = Get.put(LoginController());
  final authC = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
            body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(25, 50, 25, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: tinggi * 0.85,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Text(
                          "Hi, Welcome Back!👋",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          "Hello again, you’ve been missed!",
                          style: TextStyle(fontSize: 15, color: subjudul),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Email Address",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: TextField(
                          controller: controller.email,
                          decoration: InputDecoration(
                              labelText: "Enter Your Email",
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: border),
                                  borderRadius: BorderRadius.circular(5))),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                          obscureText:
                              controller.visibilityPassword.value ? false : true,
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
                        alignment: Alignment.topRight,
                        margin: EdgeInsets.only(top: 10),
                        child: TextButton(
                          onPressed: () => Get.toNamed('/forgot-password'),
                          child: Text(
                            "Forgot Password",
                            style: TextStyle(
                                fontSize: 15, color: Color(0xfff1B1B1b1)),
                          ),
                        ),
                      ),
                      Container(
                        width: lebar,
                        height: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: bgLogin2),
                            onPressed: () => authC.login(controller.email.text,
                                controller.password.text),
                            child: Text(
                              "Login",
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
                        margin: EdgeInsets.only(top: 30),
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
                                  onPressed: () => authC.signInWithFacebook(),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/Facebook.png"),
                                      Text(
                                        "Facebook",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
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
                                  onPressed: () => authC.signInWithGoogle(),
                                  child: Row(
                                    children: [
                                      Image.asset("assets/images/Google.png"),
                                      Text(
                                        "Google",
                                        style: TextStyle(
                                            fontSize: 17, color: Colors.black),
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
                        onPressed: () => Get.toNamed("/register"),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: bgLogin2),
                        ))
                  ],
                )
              ],
            ),
          ),
        )));
  }
}

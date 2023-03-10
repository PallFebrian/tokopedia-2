import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/create_slider_controller.dart';

class CreateSliderView extends GetView<CreateSliderController> {
  final sliderC = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(() => SafeArea(
            child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
            child: Column(
              children: [
                Container(
                    width: lebar,
                    height: 60,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [merah,ijo]),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(5))),
                    child: Center(
                      child: Text(
                        "Create Slider",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(top: 50),
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Column(
                      children: [
                        CustomInput(
                            controller: controller.gambar,
                            label: 'Link gambar Slider',
                            hint: 'Masukkan gambar',
                            obscure: false),
                        SizedBox(
                          height: 20,
                        ),
                        CustomInput(
                            controller: controller.desc,
                            label: 'Deskripsi Slider',
                            hint: 'Masukkan deskripsi',
                            obscure: false),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "active Slider",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Switch(
                                      value: controller.aktifasi.value,
                                      onChanged: (value) =>
                                          controller.changeActivation()),
                                ],
                              ),
                              Text(
                                controller.aktifasi.value.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    color: controller.aktifasi.value
                                        ? bgNav
                                        : bgRed,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  margin: EdgeInsets.only(top: 40),
                  child: InkWell(
                      onTap: () {
                        sliderC.addData(controller.aktifasi.value,
                            controller.desc.text, controller.gambar.text);
                      },
                      child: Container(
                        width: lebar,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: merah),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Buat Slider',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      )),
                ),
                ElevatedButton(onPressed: ()=> controller.uploadGambar(), child: Text('upload gambar'))
              ],
            ),
          )),
        )));
  }
}

Widget CustomInput({label, controller, obscure, hint, icon}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        child: TextFormField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              hintText: hint,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: icon,
            )),
      ),
    ],
  );
}

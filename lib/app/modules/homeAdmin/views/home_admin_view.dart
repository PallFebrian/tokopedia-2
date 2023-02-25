import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  const HomeAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeAdminView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: ()=>Get.toNamed(Routes.SLIDER_DATA),
                  child: Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Column(
                      children: [
                        Container(
                          child: Image.asset('assets/images/menu/semua.png'),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          // width: widht,
                          child: Text(
                            'slider data',
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(top: 40),

                  child: Column(
                    children: [
                      Container(
                        child: Image.asset('assets/images/menu/toserba.png'),
                      ),
                      Container(
                        // ignore: prefer_const_constructors
                        margin: EdgeInsets.only(top: 7),
                        // width: widht,
                        // ignore: prefer_const_constructors
                        child: Text(
                          'produk',
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

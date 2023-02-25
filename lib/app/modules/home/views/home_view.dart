// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, non_constant_identifier_names, use_key_in_widget_constructors, unused_local_variable, annotate_overrides

// import 'dart:html';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';

import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/modules/produk/controllers/produk_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final controller = Get.put(HomeController());
  final authC = Get.put(AuthControllerController());
  final sliderC = Get.put(SliderController());
  final controllerProduk = Get.put(PController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(25, 65, 25, 15),
                  width: lebar,
                  height: 120,
                  decoration: BoxDecoration(color: bgHeader),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: lebar * 0.45,
                        // height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Cari Nvidia RTX 4090™",
                            filled: true,
                            prefixIcon: Icon(CupertinoIcons.search),
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 2),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.transparent, width: 1),
                              borderRadius: BorderRadius.circular(6),
                              gapPadding: 5,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(6),
                              borderSide: const BorderSide(
                                  color: Colors.transparent, width: 1),
                              gapPadding: 5,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: lebar * 0.38,
                        // color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              CupertinoIcons.mail,
                              color: Colors.white,
                              size: 26,
                            ),
                            Icon(
                              CupertinoIcons.bell,
                              color: Colors.white,
                              size: 26,
                            ),
                            Icon(
                              CupertinoIcons.cart,
                              color: Colors.white,
                              size: 26,
                            ),
                            InkWell(
                              onTap: () => authC.signOut(),
                              child: Icon(
                                CupertinoIcons.line_horizontal_3,
                                color: Colors.white,
                                size: 26,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<QuerySnapshot<Object?>>(
                    future: sliderC.getData(),
                    builder: ((context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        var listData = snapshot.data!.docs;

                        return Container(
                            margin: EdgeInsets.only(top: 16),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 130,
                                autoPlay: true,
                                autoPlayCurve: Curves.easeInOutQuart,
                              ),
                              items: listData.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                        width: lebar,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadiusDirectional
                                                    .circular(8)),
                                        //  fit: BoxFit.fill,
                                        child: Image.network((i.data() as Map<
                                            String, dynamic>)['gambarSlider']));
                                  },
                                );
                              }).toList(),
                            ));
                      } else {
                        return SizedBox();
                      }
                    })),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 25,
                    runSpacing: 20,
                    children: [
                      CustomIcon(
                          icon: "assets/images/menu/promo.png", text: 'promo'),
                      CustomIcon(
                          icon: "assets/images/menu/toserba.png",
                          text: 'Toserba'),
                      CustomIcon(
                          icon: "assets/images/menu/elektronik.png",
                          text: 'Elektronik'),
                      CustomIcon(
                          icon: "assets/images/menu/tagihan.png",
                          text: 'Top-Up & tagihan'),
                      CustomIcon(
                          icon: "assets/images/menu/semua.png",
                          text: 'Lihat semua'),
                      CustomIcon(
                          icon: "assets/images/menu/official.png",
                          text: 'Official Store'),
                      CustomIcon(
                          icon: "assets/images/menu/play.png",
                          text: 'Live shopping'),
                      CustomIcon(
                          icon: "assets/images/menu/seru.png",
                          text: 'Tokopedia Seru'),
                      CustomIcon(
                          icon: "assets/images/menu/cod.png",
                          text: 'Bayar di tempat'),
                      CustomIcon(
                          icon: "assets/images/menu/indo.png",
                          text: 'Bangga lokal'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 24),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Kejar Diskon Spesial',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text('Berakhir dalam',
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400,
                                              color: abuText)),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      width: 112,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          color: merah,
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(CupertinoIcons.time,
                                              size: 16, color: Colors.white),
                                          Text(
                                            '00 : 15 : 12',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Text('Lihat Semua',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: bgHeader)),
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 25),
                        width: lebar,
                        height: 310,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff01A0C6),
                            Color(0xff01AA6C),
                          ],
                        )),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 32),
                                child: Image.asset(
                                    'assets/images/kejarDiskon.png'),
                              ),
                              Row(
                                children: [
                                  KejarDiskonCard(
                                      gambar: 'assets/images/masker.png',
                                      daerah: 'Kab. Bandung',
                                      diskon: '92%',
                                      harga: 'Rp 1.000',
                                      totalPersen: 100,
                                      currentPersen: 80,
                                      potongan: 'Rp 12.546',
                                      status: 'Segera Habis'),
                                  KejarDiskonCard(
                                      gambar: 'assets/images/colokan.png',
                                      daerah: 'Jakarta Timur',
                                      diskon: '6%',
                                      harga: 'Rp 103.000',
                                      totalPersen: 100,
                                      currentPersen: 35,
                                      potongan: 'Rp 109.900',
                                      status: 'Tersedia')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 12, left: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Pilihan Promo Hari Ini',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 12, right: 20),
                              child: Text('Lihat Semua',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: bgHeader)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 25,
                              ),
                              Row(
                                children: [
                                  Banner(
                                    gambar: 'assets/images/banner1.png',
                                  ),
                                  Banner(
                                    gambar: 'assets/images/banner2.png',
                                  ),
                                  Banner(
                                    gambar: 'assets/images/Banner3.jpeg',
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: lebar,
                        height: 1,
                        color: abu,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 12, left: 20),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Kejar Diskon Spesial',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 12, right: 20),
                              child: Text('Lihat Semua',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: bgHeader)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Card(
                                      nama: 'Logitech G603 Lightspeed ...',
                                      gambar: 'assets/images/masker.png',
                                      daerah: 'Kab. Bandung',
                                      diskon: '92%',
                                      harga: 'Rp 1.000',
                                      potongan: 'Rp 12.546',
                                      status: 'Segera Habis'),
                                  Card(
                                      nama: 'Logitech G203 Mouse Gaming',
                                      gambar: 'assets/images/colokan.png',
                                      daerah: 'Jakarta Timur',
                                      diskon: '6%',
                                      harga: 'Rp 103.000',
                                      potongan: 'Rp 109.900',
                                      status: 'Tersedia'),
                                  Card(
                                      nama: 'Logitech G240 Cloth Gaming',
                                      gambar: 'assets/images/colokan.png',
                                      daerah: 'Jakarta Timur',
                                      diskon: '6%',
                                      harga: 'Rp 103.000',
                                      potongan: 'Rp 109.900',
                                      status: 'Tersedia')
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 30, top: 30),
                        width: lebar,
                        height: 8,
                        color: abu,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              pilihan(lebar, pilihan1, pilihan2, 'For rizqi',
                                  Colors.white),
                              pilihan(lebar, pilihan3, pilihan4,
                                  'Special Discount', Colors.transparent),
                              pilihan(lebar, pilihan5, pilihan6, 'Aktivitasmu',
                                  Colors.transparent),
                              pilihan(lebar, pilihan7, pilihan8, 'Kesukaanmu',
                                  Colors.transparent),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: FutureBuilder<QuerySnapshot<Object?>>(
                          future: controllerProduk.getData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var listData = snapshot.data!.docs;
                              return Wrap(
                                spacing: 3.5,
                                runSpacing: 1,
                                children: List.generate(listData.length
                                , (index) => produk(lebar, lebar * 0.4, tinggi,listData[index]),
                              ),);
                            } else {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: tinggi * 0.02,
                      ),
                      Container(
                        width: lebar,
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(width: 1, color: abu)),
                        child: Text(
                          'Lihat Selebihnya',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: tinggi * 0.02,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(),
                      Container(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget CustomIcon({icon, text}) {
  return Container(
    width: 65,
    child: Column(
      children: [
        Container(
          child: Image.asset(icon),
        ),
        Container(
          margin: EdgeInsets.only(top: 7),
          // width: widht,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

// Widget Pilihan({warna1,warna2}){

// }

Widget pilihan(lebar, warna, warna2, judul, warna3) {
  return Container(
    width: lebar * 0.3,
    height: 66,
    padding: EdgeInsets.all(12),
    margin: EdgeInsets.only(right: 12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(6),
      gradient: LinearGradient(
        begin: Alignment.bottomCenter,
        end: Alignment.topRight,
        colors: [warna, warna2],
      ),
    ),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
        width: 25,
        height: 3,
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2), color: warna3),
      ),
      Text(
        judul,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      )
    ]),
  );
}

Widget KejarDiskonCard(
    {gambar,
    harga,
    diskon,
    potongan,
    daerah,
    status,
    totalPersen,
    currentPersen}) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    width: 146,
    height: 276,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: Column(
      children: [
        Container(
          width: 146,
          height: 146,
          child: Image.asset(gambar),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.only(bottom: 6),
                alignment: Alignment.centerLeft,
                child: Text(
                  harga,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6, top: 6),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      width: 36,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(2),
                          color: merahTrans),
                      child: Center(
                        child: Text(
                          diskon,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: merah),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        potongan,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: abuText),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: Image.asset('assets/images/os.png'),
                    ),
                    Container(
                      child: Text(
                        daerah,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: abuText),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6),
                child: StepProgressIndicator(
                  totalSteps: totalPersen,
                  currentStep: currentPersen,
                  size: 4,
                  padding: 0,
                  selectedColor: merah,
                  unselectedColor: Color(0xffeeeeee),
                  roundedEdges: Radius.circular(2),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(status,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: abuText)),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget Banner({
  gambar,
}) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    width: 146,
    height: 276,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: Column(
      children: [
        Container(
          width: 146,
          height: 276,
          child: Image.asset(gambar),
        ),
      ],
    ),
  );
}

Widget Card({
  nama,
  gambar,
  harga,
  diskon,
  potongan,
  daerah,
  status,
}) {
  return Container(
    margin: EdgeInsets.only(right: 15),
    width: 146,
    height: 294,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(color: abuText, blurRadius: 8, offset: Offset(0, 2))
    ], borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: Column(
      children: [
        Container(
          width: 146,
          height: 146,
          child: Image.asset(gambar),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
          child: Column(
            children: [
              Container(
                // margin: EdgeInsets.only(bottom: 6),
                alignment: Alignment.centerLeft,
                child: Text(
                  nama,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                // margin: EdgeInsets.only(bottom: 6),
                alignment: Alignment.centerLeft,
                child: Text(
                  harga,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6, top: 6),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 6),
                      width: 36,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(2),
                          color: merahTrans),
                      child: Center(
                        child: Text(
                          diskon,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: merah),
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        potongan,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough,
                            color: abuText),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: Image.asset('assets/images/mahkota.png'),
                    ),
                    Container(
                      child: Text(
                        daerah,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: abuText),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(status,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: abuText)),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget produk(lebar, double lebar2, tinggi,data) {
  return Container(
    height: tinggi * 0.355,
    width: lebar2,
    margin: EdgeInsets.fromLTRB(0, 15, 12, 15),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: abuText,
          blurRadius: 8,
          offset: Offset(0, 4),
        )
      ],
    ),
    child: Column(
      children: [
        Container(
          width: lebar,
          height: tinggi * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            image: DecorationImage(
                image: NetworkImage(
                  (data.data() as Map<String,dynamic>)['gambar'].toString(),
                ),
                fit: BoxFit.cover),
          ),
        ),
        Container(
          width: lebar,
          height: tinggi * 0.163,
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
                // margin: EdgeInsets.only(bottom: 6),
                alignment: Alignment.centerLeft,
                child: Text(
                        (data.data() as Map<String,dynamic>)['namaBarang'].toString(),
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ),
              Text(
                 (data.data() as Map<String,dynamic>)['hargaAsli'].toString(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: tinggi * 0.006,
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 20,
                    margin: EdgeInsets.only(right: 6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(1),
                      color: merahTrans,
                    ),
                    child: Text(
                       (data.data() as Map<String,dynamic>)['diskon'].toString(),
                      style: TextStyle(
                          color: merah,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                  Text(
                    (data.data() as Map<String,dynamic>)['hargaDiskon'].toString(),
                    style: TextStyle(
                        decoration: TextDecoration.lineThrough,
                        fontSize: 12,
                        color: abuText),
                  )
                ],
              ),
              SizedBox(
                height: tinggi * 0.006,
              ),
              Row(
                children: [
                  Image.network(
                     (data.data() as Map<String,dynamic>)['statusToko'].toString(),
                    width: 15,
                  ),
                  Text(
                      (data.data() as Map<String,dynamic>)['alamatPenjual'].toString(),
                    style: TextStyle(
                      color: abuText,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: tinggi * 0.011,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 3),
                    child: Icon(
                      Icons.star,
                      color: star,
                      size: 14,
                    ),
                  ),
                  Text(
                    '4.8 | Terjual 312',
                    style: TextStyle(color: abuText, fontSize: 13),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

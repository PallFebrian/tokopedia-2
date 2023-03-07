// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/modules/produk/controllers/produk_controller.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final data = Get.arguments; 

  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    String gambarP = (data as Map<String, dynamic>)["gambar"];
    int hargaP = (data as Map<String, dynamic>)["hargaDiskon"];
    String namaBarang =(data as Map<String, dynamic>)["namaBarang"];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(25, 65, 25, 15),
                  width: lebar,
                  height: 120,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.arrow_back,
                          color: item,
                          size: 26,
                        ),
                      ),
                      Container(
                        width: lebar * 0.45,
                        // height: 40,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Cari Nvidia RTX 4090™",
                            filled: true,
                            prefixIcon: const Icon(Icons.search),
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 2),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: abu, width: 1),
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
                        width: lebar * 0.3,
                        // color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            // ignore: prefer_const_constructors
                            Icon(
                              Icons.share,
                              color: item,
                              size: 26,
                            ),
                            // ignore: prefer_const_constructors
                            Icon(
                              Icons.shopping_cart,
                              color: item,
                              size: 26,
                            ),
                            // ignore: prefer_const_constructors
                            Icon(
                              Icons.menu,
                              color: item,
                              size: 26,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    width: lebar,
                    // height: tinggi,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.network(gambarP),
                      ],
                    )),
                ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // alignment: Alignment.centerLeft,
                              child: Text(
                               hargaP.toString() ,
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    color: item,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const Icon(
                              Icons.favorite_border,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child:  Text(
                          namaBarang,
                          style: TextStyle(color: gaItem2, fontSize: 19),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 25,
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: Text(
                            'Terjual 250+',
                            style: TextStyle(color: abuText, fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 7),
                          height: tinggi * 0.04,
                          width: lebar * 0.22,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: gaItem),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // ignore: prefer_const_literals_to_create_immutables
                            children: [
                              // ignore: prefer_const_constructors
                              Icon(
                                Icons.star_rounded,
                                color: star,
                                size: 15,
                              ),
                              const Text(
                                '4.9 (320)',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 7),
                            height: tinggi * 0.04,
                            width: lebar * 0.32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: gaItem),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "Foto Pembeli (50)",
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(right: 7),
                            height: tinggi * 0.04,
                            width: lebar * 0.28,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: gaItem),
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              child: const Text(
                                "Diskusi (25)",
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  height: 8,
                  width: lebar,
                  color: abu,
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Detail produk",
                          style: const TextStyle(
                              color: item,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: lebar * 0.45,
                                child: const Text("Berat Satuan")),
                            Container(
                                width: lebar * 0.45,
                                alignment: Alignment.centerLeft,
                                child: const Text("200 g")),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        height: 2,
                        width: lebar,
                        color: abu,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: lebar * 0.45,
                                child: const Text("Etalase")),
                            Container(
                                width: lebar * 0.45,
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Mine Private Collection",
                                  style: TextStyle(
                                      color: bgLogin,
                                      fontWeight: FontWeight.w600),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                        ),
                        height: 2,
                        width: lebar,
                        color: abu,
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        alignment: Alignment.centerLeft,
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Deskripsi produk",
                          style: const TextStyle(
                              color: item,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        // ignore: prefer_const_constructors
                        child: Text(
                          "Mine. ETHEREAL Eau De Parfum 50mi glass perfume bottle in hard box packaging • ETHEREAL • Withfacets that highlight a side ...",
                          style: const TextStyle(fontSize: 19, color: item),
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Baca Selengkapnya',
                          style: TextStyle(
                              fontSize: 16,
                              color: bgLogin,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                  ),
                  height: 2,
                  width: lebar,
                  color: abu,
                ),
                ///////////////////////////////////
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/profile.png'),
                          SizedBox(
                            width: lebar * 0.015,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/os.png',
                                      width: 18),
                                  const Text(
                                    ' Mine. Parfumery',
                                    style: TextStyle(
                                        color: item,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: tinggi * 0.01,
                              ),
                              RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                    text: 'Online',
                                    style: TextStyle(color: abuAbu),
                                  ),
                                  TextSpan(
                                    text: ' 23 Jam lalu',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: abuAbu),
                                  ),
                                ]),
                              ),
                              SizedBox(
                                height: tinggi * 0.006,
                              ),
                              const Text('Kota Tangerang'),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: lebar * 0.2,
                        height: 37,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(width: 1, color: bgHeader)),
                        child: Text(
                          'Follow',
                          style: TextStyle(
                              color: bgHeader,
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.only(
                  //   top: 10,
                  // ),
                  height: 8,
                  width: lebar,
                  color: abu,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Lainnya di toko ini',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        child: Text('Lihat Semua',
                            style: TextStyle(
                                fontSize: 16,
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
                              nama: 'Mine. Perfumery FLORAISON ...',
                              gambar: 'assets/images/masker.png',
                              daerah: 'Kota Tangerang',
                              diskon: 'Cashback',
                              harga: 'Rp 370.000',
                            ),
                            Card(
                              nama: 'Mine. Perfumery TATMI - 50ml ...',
                              gambar: 'assets/images/colokan.png',
                              daerah: 'Kota Tangerang',
                              diskon: 'Cashback',
                              harga: 'Rp 450.000',
                            ),
                            Card(
                              nama: 'Mine. Perfumery LUCID DREA...',
                              gambar: 'assets/images/colokan.png',
                              daerah: 'Kota Tangerang',
                              diskon: 'Cashback',
                              harga: 'Rp 370.000',
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.only(
                  //   top: 10,
                  // ),
                  height: 8,
                  width: lebar,
                  color: abu,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        // ignore: prefer_const_constructors
                        child: Text(
                          'Ulasan pembeli',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        child: Text('Lihat Semua',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: bgHeader)),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Icon(
                          Icons.star_rounded,
                          color: star,
                          size: 25,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Text(
                          "4.9",
                          style: TextStyle(
                              color: item,
                              fontWeight: FontWeight.w600,
                              fontSize: 22),
                        ),
                      ),
                      Text(
                        "320 rating ∙ 102 ulasan",
                        style: TextStyle(color: abuText, fontSize: 16),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      review('assets/images/mw1.png', ''),
                      review('assets/images/mw2.png', ''),
                      review('assets/images/mw3.png', ''),
                      review('assets/images/mw4.png', ''),
                      review('assets/images/mw5.png', ''),
                    ],
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.02,
                ),
                /////////////////////////////////////////////////////////////////////
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Divider(
                    thickness: 1,
                    color: abu,
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 12),
                        child: Image.asset('assets/images/orang.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zain Ekstrom Bothman',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '31 ulasan lengkap ∙ 17 terbantu',
                            style: TextStyle(color: abuText),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: star,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: star,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: star,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: star,
                            size: 15,
                          ),
                          Icon(
                            Icons.star,
                            color: star,
                            size: 15,
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Text(
                            '10 bulan lalu',
                            style: TextStyle(color: abuText),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  // ignore: prefer_const_constructors
                  child: Text(
                    'saya selalu tertarik dengan produk lokal, buat saya aroma nomor 2 karena subyektif, Kemasan nomor selanjutnya, tapi yang perlu di',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.01,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'Baca Selengkapnya',
                    style: TextStyle(
                      color: bgLogin,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.02,
                ),
                pembatas(lebar),
                SizedBox(
                  height: tinggi * 0.02,
                ),
                heading2('Diskusi'),
                SizedBox(
                  height: tinggi * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Image.asset('assets/images/orang2.png'),
                      Container(
                        padding: EdgeInsets.only(left: 12),
                        child: Row(
                          children: [
                            Text(
                              'Rayna Stanton',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: abuText,
                                  fontSize: 15),
                            ),
                            Text(
                              ' ∙ Apr 2022',
                              style: TextStyle(color: abuText),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'hai! kira-kira kapan restock lagi? thanks in      advance',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset('assets/images/penjual1.png'),
                          Container(
                              width: 60,
                              height: 25,
                              margin: EdgeInsets.only(left: 12),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: ijoTrans,
                              ),
                              child: Text(
                                'Penjual',
                                style: TextStyle(
                                    color: bgLogin,
                                    fontWeight: FontWeight.w600),
                              )),
                          Text(
                            '∙ Apr 2022',
                            style: TextStyle(color: abuText),
                          )
                        ],
                      ),
                      SizedBox(
                        height: tinggi * 0.01,
                      ),
                      Text(
                        'Halo kak, maaf banget yak karena kamu jadi nunggu saat ini kita masih out of stock ya ...',
                        style: TextStyle(color: abuText, fontSize: 14.3),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.02,
                ),
                pembatas(lebar),
                SizedBox(
                  height: tinggi * 0.02,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Container(
                        width: 20,
                        height: 20,
                        margin: EdgeInsets.only(right: 14),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: abuText),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          '!',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, color: abuText),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Produk bermasalah? ',
                            style: TextStyle(color: abuText),
                          ),
                          Text(
                            'Laporkan',
                            style: TextStyle(
                              color: bgLogin,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: tinggi * 0.02,
                ),
                Container(
                  width: lebar,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                      border: Border(top: BorderSide(width: 1.5, color: abu))),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1.5, color: abu),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Icon(
                            Icons.chat,
                            size: 26,
                          ),
                        ),
                        Container(
                            width: lebar * 0.375,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.5, color: bgLogin),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              'Beli Langsung',
                              style: TextStyle(
                                  color: bgLogin,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            )),
                        Container(
                            width: lebar * 0.375,
                            height: 45,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: bgLogin,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              '+Keranjang',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15),
                            )),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget heading2(judul) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          judul,
          style: TextStyle(
            color: item,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          'Lihat Semua',
          style: TextStyle(color: bgLogin, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget pembatas(lebar) {
  return Container(
    width: lebar,
    height: 8,
    color: abu,
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
    width: 150,
    height: 281,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(
        color: abuText,
        blurRadius: 8,
        offset: Offset(0, 4),
      )
    ], borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: Column(
      children: [
        Container(
          width: 150,
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
                      width: 55,
                      height: 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(2),
                          color: ijoTrans),
                      child: Center(
                        child: Text(
                          diskon,
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: ijo),
                        ),
                      ),
                    ),
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
            ],
          ),
        )
      ],
    ),
  );
}

Widget review(gambar, judul) {
  return Container(
    width: 60,
    height: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      image: DecorationImage(image: AssetImage(gambar)),
    ),
    child: Text(
      judul,
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16),
    ),
  );
}

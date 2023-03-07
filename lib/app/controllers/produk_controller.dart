// ignore_for_file: unnecessary_overrides, unused_import, avoid_print, prefer_const_constructors, unused_local_variable, unused_catch_clause, non_constant_identifier_names

// import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:file_picker/file_picker.dart';

class PController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String url = "";
  File? path;

//   addData(String alamatPenjual,String deskripsi, int diskon,) async {
//     CollectionReference slider = firestore.collection('slider');

//     final produk = {
//       "alamatPenjual": alamatPenjual,
//       "deskSlider": deskSlider,
//       "gambarSlider": gambarSlider
//     };

// // Add a new document with a generated ID
//     try {
//       await slider.add(produk).then((DocumentReference doc) {
//         print('DocumentSnapshot added with ID: ${doc.id}');
//         Get.defaultDialog(title: 'Alert', middleText: 'berhasil menambah data');
//         Get.offNamed(Routes.SLIDER_DATA);
//       });
//     } catch (e) {
//       Get.defaultDialog(title: 'Alert', middleText: 'gagal menambah data');
//     }
//   }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference produk = firestore.collection('produk');

    return await produk.get();
  }

  filterData() async {
    final result = await firestore
        .collection('produk')
        // .where('hargaAsli2', isGreaterThan: 150000)
        // .orderBy('hargaAsli',descending: true)//dari mahal ke kecil
        // .limitToLast(5)
        .where('flashSale',isEqualTo: true)
        .get();
    print(result.docs.length);
    print('******************************');

    if (result.docs.length > 0) {
      result.docs.forEach((element) {
        print(element.data());
      });
    } else {
      print('tidak ada');
    }
  }
  Future<QuerySnapshot<Object?>> getDataDiskon() async {
    
    CollectionReference produk = firestore.collection("produk");

    return await produk.where('flashSale', isEqualTo: true).get();
  }
  
}

 
  
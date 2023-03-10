import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/slider_data_controller.dart';

class SliderDataView extends GetView<SliderDataController> {
  final sliderC = Get.put(SliderController());
  final sliderDC = Get.put(SliderDataController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Scaffold(
      body: Container(
        child: FutureBuilder<QuerySnapshot<Object?>>(
            future: sliderC.getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var listData = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: listData.length,
                    itemBuilder: (context, index) => ListTile(
                          onTap: () => Get.toNamed(Routes.UPDATE_DATA,
                              arguments: listData[index]),
                          onLongPress: () =>
                              sliderC.deleteData(listData[index].id),
                          title: Text((listData[index].data()
                              as Map<String, dynamic>)['deskSlider']),
                          subtitle: Text(
                            (listData[index].data()
                                    as Map<String, dynamic>)['activeSlider']
                                .toString(),
                            style: TextStyle(
                                fontSize: 16,
                                color: (listData[index].data()
                                        as Map<String, dynamic>)['activeSlider']
                                    ? bgHeader
                                    : merah,
                                fontWeight: FontWeight.w500)
                          ),
                          // leading: Container(
                          //   child: Image.network((listData[index].data()
                          //       as Map<String, dynamic>)['gambarSlider']),
                          // ),
                          trailing: IconButton(
                            onPressed: () {
                              sliderC.deleteData((listData[index].id));
                            },
                            icon: Icon(
                              CupertinoIcons.trash,
                              color: merah,
                            ),
                          ),
                        ));
              } else {
                return (Center(
                  child: CircularProgressIndicator(),
                ));
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.CREATE_SLIDER),
        child: Icon(CupertinoIcons.add),
      ),
    )));
  }}
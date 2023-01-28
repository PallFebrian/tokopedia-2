import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';

import 'app/routes/app_pages.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final controller = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: controller.streamAuthStatus(),
        builder: (context, snapshot) {
          // ignore: avoid_print
          print(snapshot.connectionState);
          if (snapshot.connectionState == ConnectionState.active) {
            print(snapshot.data);
            return GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: "Application",
              initialRoute:
                  snapshot.data != null ? Routes.HOME : Routes.SPLASH_SCREEN,
              getPages: AppPages.routes,
            );
          } else {
            // ignore: prefer_const_constructors
            return MaterialApp(
              // ignore: prefer_const_constructors
              home: Scaffold(
                // ignore: prefer_const_constructors
                body: Center(
                  child: const CircularProgressIndicator(),
                ),
              ),
            );
          }
        });
  }
}

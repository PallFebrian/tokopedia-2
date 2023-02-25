// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthControllerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  String kodeVerifikasi = "";

  Stream<User?> streamAuthStatus() => auth.authStateChanges();

  login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.offAllNamed(Routes.HOME_ADMIN);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  register(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailAddress, password: password);
      credential.user?.sendEmailVerification();
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  resetPassword(String email) async {
    try {
      final Credential = await auth.sendPasswordResetEmail(email: email);
      Get.toNamed('/check-email');
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: 'alert', middleText: 'gagal reset password');
    }
  }

  signOut() {
    Get.defaultDialog(
        title: 'are you suri',
        middleText: 'logout?',
        confirm: ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAllNamed(Routes.LOGIN);
            },
            child: Text('yes')),
        cancel: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: merah),
            onPressed: () => Get.back(),
            child: Text('no')));
  }

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    Get.toNamed('/home');
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  verifyPhone(String nomor) async {
    await auth.verifyPhoneNumber(
        phoneNumber: '+62$nomor',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            if (value.user != null) {
              Get.toNamed(Routes.HOME);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.defaultDialog(
            title: 'Alert',
            middleText: 'gagal mengirim SMS',
          );
        },
        codeSent: (String verificationId, int? resendToken) {
          kodeVerifikasi = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          kodeVerifikasi = verificationId;
        },
        timeout: Duration(seconds: 60));

    Get.toNamed(Routes.VERIFIKASI_O_T_P, parameters: {"phone": nomor});
  }

  checkOTP(String kodeSMS) async {
    try {
      await auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: kodeVerifikasi, smsCode: kodeSMS))
          .then((value) {
        if (value.user != null) {
          Get.toNamed(Routes.HOME);
        }
      });
    } catch (err) {
      Get.defaultDialog(
        title: 'Alert',
        middleText: 'Kode verifikasi salah',
      );
    }
  }
}

// ignore_for_file: avoid_print

import 'dart:math';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:wanderly/services/auth_constants.dart';
import 'package:wanderly/utils/colors.dart';

class AuthController extends GetxController {
  static AuthController authInstance = Get.find();
  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => print(e.toString()));
    } else {
      Get.offAll(() => print(e.toString()));
    }
  }

  void login(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
    } catch (e) {
      print(e.toString());
    }
  }

  void forgotten(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Get.rawSnackbar(
        titleText: Text(
          'Erro ao Recuperar',
          style: TextStyle(
            color: primaryGreyColor,
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        messageText: Text(
          'Digite um email válido!',
          style: TextStyle(
            color: primaryGreyColor,
            fontSize: 11,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        icon: Icon(
          Ionicons.close_circle_outline,
          color: primaryGreyColor,
          size: 25,
        ),
        margin: EdgeInsets.all(20),
        borderRadius: 10,
        backgroundColor: secondaryGreyColor,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
      Get.rawSnackbar(
        titleText: Text(
          'Email enviado',
          style: TextStyle(
            color: primaryGreyColor,
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        messageText: Text(
          'Um email foi enviado para recuperar sua senha!',
          style: TextStyle(
            color: primaryGreyColor,
            fontSize: 11,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        icon: Icon(
          Ionicons.mail,
          color: primaryGreyColor,
          size: 25,
        ),
        margin: EdgeInsets.all(20),
        borderRadius: 10,
        backgroundColor: secondaryGreyColor,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void register(String email, String password, String text) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      Get.rawSnackbar(
        titleText: Text(
          'Erro ao Registrar',
          style: TextStyle(
            color: primaryGreyColor,
            fontSize: 12,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w700,
          ),
        ),
        messageText: Text(
          'Digite um email ou senha válidos!',
          style: TextStyle(
            color: primaryGreyColor,
            fontSize: 11,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
          ),
        ),
        icon: Icon(
          Ionicons.close_circle_outline,
          color: primaryGreyColor,
          size: 25,
        ),
        margin: EdgeInsets.all(20),
        borderRadius: 10,
        backgroundColor: secondaryGreyColor,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      print(e.toString());
    }
  }

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

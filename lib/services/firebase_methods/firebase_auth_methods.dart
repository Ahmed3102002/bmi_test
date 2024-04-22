import 'dart:math';

import 'package:bmi/models/calculation_model.dart';
import 'package:bmi/models/user_model.dart';
import 'package:bmi/view/widgets/custom_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserInfoMethods {
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static late UserModel userInfo;
  static void setUserInfo(
      {required String name,
      required String email,
      required int age,
      required BuildContext context}) async {
    UserModel userModel = UserModel(
      age: age,
      name: name,
      email: email,
    );
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userModel.id)
          .set(userModel.toJson(userModel));
      getUserInfo();
    } on FirebaseAuthException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: CustomText(text: error.toString()),
          ),
        );
      }
    }
  }

  static Future<UserModel> getUserInfo() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
        .instance
        .collection('users')
        .doc(auth.currentUser!.uid)
        .get();
    if (!snapshot.exists) {
      throw Exception('User data not found!');
    }
    userInfo = UserModel.fromJson(snapshot.data()!);
    return userInfo;
  }

  static void setCalculation(
      {required double height,
      required double weight,
      required int age,
      required BuildContext context}) async {
    CalculationModel calculationModel = CalculationModel(
      age: age,
      height: height,
      weight: weight,
      bmi: weight / pow(height / 100, 2),
    );
    try {
      await FirebaseFirestore.instance
          .collection('all_calculations')
          .doc(auth.currentUser!.uid)
          .collection('calculation')
          .add(calculationModel.toJson(calculationModel));
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.white,
            content: CustomText(text: error.toString()),
          ),
        );
      }
    }
  }

  static Future<void> deleteCalculation({required String calculationId}) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection('all_calculations')
        .doc(auth.currentUser!.uid)
        .collection('calculation')
        .doc(calculationId);
    await docRef.delete();
  }
}

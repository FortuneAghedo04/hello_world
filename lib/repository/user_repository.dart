import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../database/user_model.dart';
class UserRepository extends GetxController{
  static UserRepository get instance=> Get.find();
  final _db=FirebaseFirestore.instance;
  createUser(UserModel user) async {
   await  _db.collection('Users').add(user.toJson()).whenComplete(() =>
    Get.snackbar('Success','Your account has been created.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.white),
    )
    .catchError((error, stackTrace){
      Get.snackbar('Error', 'Something went wrong. Try again',
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red.withOpacity(0.1),
    colorText: Colors.white);
     print(error.toString());
    });
  }
}
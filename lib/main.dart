import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world/register/sign_in.dart';
import 'package:hello_world/register/sign_up.dart';
import'package:hello_world/pages/main_food.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_world/register/main_page.dart';
import 'package:hello_world/splash_screen.dart';



// TO BE ABLE TO RUN FIREBASE IN YOUR PROJECT
Future main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
     home: SplashScreen(),


  ));
}





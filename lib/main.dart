import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hello_world/register/main_page.dart';

// TO BE ABLE TO RUN FIREBASE IN YOUR PROJECT
Future main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
     home: SplashScreen(),


  ));
}

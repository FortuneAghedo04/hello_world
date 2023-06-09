import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hello_world/pages/main_food.dart';
import 'package:hello_world/register/sign_in.dart';
import 'auth_page.dart';
class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream:FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            return MainFood();
          }
          else{
            return AuthPage();
          }
        }

      )
    );
  }
}

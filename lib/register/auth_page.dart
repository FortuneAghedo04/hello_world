// TO KNOW WHERE TO DIRECT THE USER EITHER TO THE LOGIN OR SIGN UP PAGE
import 'package:flutter/material.dart';
import 'package:hello_world/register/sign_in.dart';
import 'package:hello_world/register/sign_up.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showSignIn=true;
  // TO ALTERNATE BETWEEN THE TWO SCREENS
  void  togglescreen(){
    setState((){
      showSignIn= !showSignIn;
    });

  }
  @override
  Widget build(BuildContext context) {
    if(showSignIn){
      return SignIn(showSignUp:togglescreen );
    }
    else{
      return SignUp(showSignIn:togglescreen );

    }
  }
}


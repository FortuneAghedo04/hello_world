import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hello_world/dimensions/dimensions.dart';
import 'package:hello_world/register/main_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer(){
    Timer( const Duration(seconds: 5), () async{
      Navigator.push(context, MaterialPageRoute(builder:(c)=> const MainPage()));

    });
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      child:Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Image.asset('splash.png'),
              SizedBox(height: getProportionateScreenHeight(10.0)),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text('Food made easy, just for you.',
                    textAlign:TextAlign.center,
                  style: TextStyle(
                    color:Colors.black54,fontSize: 30.0,fontWeight: FontWeight.bold, letterSpacing: 3.0
                  ),
                ),
              )
            ],
          ),

        ),
      ),

    );
  }
}

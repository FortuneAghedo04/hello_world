import'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import'package:hello_world/dimensions/dimensions.dart';
class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child:Padding(padding:EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
        child:Row(
          children:[
            for(int i=0; i<=10;i++)
            Padding(padding:EdgeInsets.symmetric(horizontal:10.0),
              child:Container(
                padding: EdgeInsets.all(8.0),
                decoration:BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow:[
                  BoxShadow(
                color:Colors.grey.withOpacity(0.5),
                spreadRadius:2.0,
                blurRadius:10.0,
                    offset:Offset(0,3),
              ),
          ]),
      child: Image.asset('assets/fried.jpg',
        width: getProportionateScreenWidth(50.0),
        height: getProportionateScreenHeight(50.0),
      ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}


import'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello_world/widgets/appbarwidget.dart';
import 'package:hello_world/dimensions/dimensions.dart';
import 'package:hello_world/pages/categories.dart';
import 'package:hello_world/pages/popularitem.dart';

import '../widgets/drawer_widget.dart';

class MainFood extends StatefulWidget {

  const MainFood({Key? key}) : super(key: key);

  @override
  State<MainFood> createState() => _MainFoodState();
}

class _MainFoodState extends State<MainFood> {
  CartPage(){
   Navigator.push(context,MaterialPageRoute(builder:(context)=>CartPage()));
  }

  @override
  Widget build(BuildContext context) {
      Dimensions().init(context);
    // To get screen height of a device
     print('screen height is'+ MediaQuery.of(context).size.height.toString());
    return Scaffold(
      body: ListView(
        children:[
          // App Bar Widget
          AppBarWidget(),
          // Search
          Padding(padding:EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            child:Container(
              width:double.infinity,
              height:getProportionateScreenHeight(50),
              decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2.0,
                      blurRadius: 10.0,
                      offset:Offset(0,3),
                    ),
                  ]
              ),
              child: Padding(padding:EdgeInsets.symmetric(horizontal: 10.0),
                child:Row(
                  mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(CupertinoIcons.search,color:Colors.red),
                    Container(
                      height: getProportionateScreenHeight(50),
                      width:getProportionateScreenWidth(300),
                      child: Padding(padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText:'What would like to have',
                            border:InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.filter_list),
                  ],
                ),
              ),
            ),
          ),
          // CATEGORY OF FOODS
          Padding(
              padding:EdgeInsets.only(top:20.0, left:10.0),
              child:Text('Categories',
                style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
              )
          ),
          CategoriesWidget(),
          // POPULAR ITEMS
          Padding(
              padding:EdgeInsets.only(top:20.0, left:10.0),
              child:Text('Popular',
                style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
              )
          ),
          PopularItemWidget(),
        ],
      ),
      drawer: DrawerWidget(),
      floatingActionButton:Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2.0,
                blurRadius: 10.0,
                offset: Offset(0,3),
              ),
            ]),
        child: GestureDetector(
          onTap:CartPage,
          child: FloatingActionButton(
            onPressed: (){},
            child: Icon(CupertinoIcons.cart,
              size: 24.0,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}



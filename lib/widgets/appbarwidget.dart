import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(
        horizontal: 15.0, vertical: 15.0),
      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){
              Scaffold.of(context).openDrawer();
            },
            child: Container(
              padding:EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow:[
                  BoxShadow(
                    color:Colors.grey.withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 10.0,
                    offset: Offset(0,3),

                  )
                ],
              ),
               child:Icon(CupertinoIcons.bars),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              padding:EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
                boxShadow:[
                  BoxShadow(
                    color:Colors.grey.withOpacity(0.5),
                    spreadRadius: 2.0,
                    blurRadius: 10.0,
                    offset: Offset(0,3),

                  )
                ],
              ),
              child:Icon(Icons.notifications),
            ),
          ),
        ],
      ),


    );

  }
}

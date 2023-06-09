import'package:flutter/material.dart';
import'package:flutter/cupertino.dart';
import'package:hello_world/dimensions/dimensions.dart';
class PopularItemWidget extends StatefulWidget {
  const PopularItemWidget({Key? key}) : super(key: key);

  @override
  State<PopularItemWidget> createState() => _PopularItemWidgetState();
}

class _PopularItemWidgetState extends State<PopularItemWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics:  NeverScrollableScrollPhysics(),
      shrinkWrap:true,
      scrollDirection:Axis.vertical,
      itemCount: 10,
      itemBuilder:(context, index){
       return Padding(
        padding:EdgeInsets.symmetric(horizontal:5.0, vertical:15.0),
        child:Row(
        children:[
         Padding(
        padding:EdgeInsets.symmetric(horizontal:7.0),
        child:Container(
        width:getProportionateScreenWidth(220),
        height:getProportionateScreenHeight(180),
        decoration:BoxDecoration(
        color:Colors.white,
        borderRadius:BorderRadius.circular(10.0),
        boxShadow:[
        BoxShadow(
        color:Colors.grey.withOpacity(0.5),
        spreadRadius: 3.0,
        blurRadius: 10.0,
        offset: Offset(0,3),
        ),
        ],
        ),
        child: Padding(
        padding: EdgeInsets.symmetric(horizontal:10.0),
        child:SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
        alignment: Alignment.center,
        child: Image.asset('assets/whiterice.jpg'),
        height: getProportionateScreenHeight(140),
        ),
        Text('White Rice',
        style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height:getProportionateScreenHeight(4.0)),
        Text('Enjoy while it is hot',
        style: TextStyle(fontSize: 10.0),
        ),
        SizedBox(height: getProportionateScreenHeight(9.0)),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Text(
        'N450',
        style:TextStyle(color: Colors.red, fontWeight: FontWeight.bold,fontSize: 15.0),
        ),
        Icon(Icons.favorite_border, color: Colors.redAccent,size: 14.0),
        ],
        ),
        ],
        ),
        ),
        ),
        ),
        )
        ],
        ),
        );
       },

    );
  }
}

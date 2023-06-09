// import 'package:flutter/material.dart';
//
// import '../dimensions/dimensions.dart';
// class FoodItems extends StatelessWidget {
//   final String title;
//   final String thumbnailUrl;
//   final String cooktime;
//   const FoodItems({Key? key, required this.title, required this.thumbnailUrl, required this.cooktime}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
//       width: MediaQuery.of(context).size.width,
//       height:getProportionateScreenHeight(100.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.5),
//             offset: Offset(
//               0.0,
//               10.0
//             ),
//             blurRadius: 10.0,
//             spreadRadius: -6.0,
//           ),
//         ],
//           image: DecorationImage(
//             colorFilter: ColorFilter.mode(
//             Colors.black.withOpacity(0.35),
//                 BlendMode.multiply
//     ),
//     image: NetworkImage(thumbnailUrl),
//     fit: BoxFit.cover,
//       ),
//     ),
//       child: Stack(
//         children: [
//           Align(
//             child: Padding(padding:EdgeInsets.symmetric(horizontal: 5.0),
//               child: Text(
//                 title,
//                 style: TextStyle(fontSize: 19.0),
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 2,
//                 textAlign:TextAlign.center
//               ),
//             ),
//             alignment: Alignment.center,
//           ),
//           Align(
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Container(
//                   padding: EdgeInsets.all(5.0),
//                   margin: EdgeInsets.all(10.0),
//                   decoration: BoxDecoration(
//                     color: Colors.black.withOpacity(0.4),
//                     borderRadius: BorderRadius.circular(15.0),
//                   ),
//                   child: Row(
//                     children: [
//                       I
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

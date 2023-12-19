// import 'package:flutter/material.dart';
// class View_Widget extends StatelessWidget {
//   const View_Widget({Key? key,this.image,this.ontap, this.name, this.date}) : super(key: key);
//   final name,image,date;
//   final Function()? ontap;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.0),
//         boxShadow: [BoxShadow(
//             color: Colors.black38,
//             blurRadius: 18,
//             offset: Offset(0,0)
//         )],
//         color: Colors.blue,
//       ),
//       child: InkWell(
//         onTap: (){
//           ontap;
//         },
//         child: Column(
//           children: [
//             Container(
//                 height: 120,
//                 width: double.maxFinite,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage(image),fit: BoxFit.cover,),
//                 )
//
//
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.only(top: 3),
//                       child: Text('$name',style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: 19.0,
//                       ),),
//                     ),
//                     SizedBox(
//                       height: 20.0,
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(top: 3),
//                       child: Text('$date',style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black,
//                         fontSize: 15.0,
//                       ),),
//                     ),
//                   ],
//                 ),
//
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//
//   }
// }
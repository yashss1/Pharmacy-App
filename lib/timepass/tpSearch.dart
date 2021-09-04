// import 'package:flutter/material.dart';
// import 'package:pharmacy_app/ResultPage.dart';
// import 'package:pharmacy_app/constants.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:pharmacy_app/services/networking.dart';
//
// class TpSearch extends StatefulWidget {
//   const TpSearch({Key? key}) : super(key: key);
//
//   @override
//   _TpSearchState createState() => _TpSearchState();
// }
//
// class _TpSearchState extends State<TpSearch> {
//   late String msg;
//   bool show_loader = false;
//
//   void getData() async {
//     NetworkHelper networkHelper =
//         NetworkHelper('https://api.fda.gov/drug/event.json?limit=3');
//     var medData = await networkHelper.getData();
//     Navigator.push(context, MaterialPageRoute(builder: (context) {
//       return ResultPage(
//         medData: medData,
//       );
//     }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(left: 15, right: 15, top: 200),
//                 child: Container(
//                   child: TextField(
//                     keyboardType: TextInputType.emailAddress,
//                     textAlign: TextAlign.center,
//                     onChanged: (value) {
//                       //Do something with the user input.
//                       msg = value;
//                     },
//                     decoration: kTextFieldDecoration.copyWith(
//                       hintText: "Enter Medicine",
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               RaisedButton(
//                 onPressed: () {
//                   show_loader = true;
//                   setState(() {});
//
//                   getData();
//                 },
//                 child: Text(
//                   'Click',
//                 ),
//               )
//             ],
//           ),
//           Align(
//             alignment: Alignment.center,
//             child: show_loader
//                 ? SpinKitDoubleBounce(
//                     color: Colors.black,
//                     size: 100.0,
//                   )
//                 : Container(),
//           ),
//         ],
//       ),
//     );
//   }
// }

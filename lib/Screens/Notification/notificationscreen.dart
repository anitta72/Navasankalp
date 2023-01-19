// import 'package:flutter/material.dart';

// class NotificationScreen extends StatelessWidget {
//   const NotificationScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.blue[100],
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.blue[100],
//         automaticallyImplyLeading: false,
//         title: Row(
//           children: const [
//             SizedBox(
//               width: 30,
//             ),
//             Padding(
//               padding: EdgeInsets.fromLTRB(100, 10, 0, 0),
//               child: Text(
//                 "Notifications",
//                 style: TextStyle(color: Colors.black),
//               ),
//             )
//           ],
//         ),
//         actions: const [],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             children: const [NotificationWidget()],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class NotificationWidget extends StatelessWidget {
//   const NotificationWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//             color: Colors.white38, borderRadius: BorderRadius.circular(5)),
//         child: Row(
//           children: [
//             Container(
//               width: 100,
//               height: 100,
//               // decoration: const BoxDecoration(
//               //     shape: BoxShape.circle,
//               //     image: DecorationImage(
//               //         image: AssetImage("images/image 23.png"),
//               //         fit: BoxFit.cover)),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: const [
//                 Text("M S Anilkumar added\na new photo in Facebook"),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "4 hours ago",
//                   style: TextStyle(fontSize: 11),
//                 )
//               ],
//             )
//           ],
//         ));
//   }
// }

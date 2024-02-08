// // ignore_for_file: prefer_const_constructors

// import 'package:learn/models/products.dart';
// import 'package:flutter/material.dart';

// class ItemWidget extends StatelessWidget {
//   final Item item;

//   const ItemWidget({super.key, required this.item});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         onTap: () {
//           print("${item.name} pressed");
//         },
//         tileColor: Colors.white,
//         leading: Image.network(item.image),
//         title: Text(item.name),
//         subtitle: Text(item.desc,
//             style: TextStyle(
//                 fontStyle: FontStyle.italic, fontWeight: FontWeight.w200)),
//         trailing: Text(
//           "₹ ${item.price}",
//           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//         ),
//       ),
//     );
//   }
// }

// // ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

// import 'package:learn/utils/routes.dart';
// import 'package:flutter/material.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   String name = "Login page";
//   bool changeButton = false;

//   moveToHome(BuildContext context) async {
//     if (_formKey.currentState != null && _formKey.currentState!.validate()) {
//       setState(() {
//         changeButton = !changeButton;
//       });
//       await Future.delayed(Duration(milliseconds: 1500));
//       await Navigator.popAndPushNamed(context, AllRoutes.homeRoute);
//       setState(() {
//         changeButton = !changeButton;
//         name = "Login Page";
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Material(
//       color: Colors.white,
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 20,
//             ),
//             Image.asset(
//               'assets/images/hello.png',
//               fit: BoxFit.cover,
//             ),
//             Text(
//               name,
//               style: TextStyle(
//                 fontSize: 30,
//                 color: Colors.orangeAccent,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     TextFormField(
//                       decoration: InputDecoration(
//                         hintText: "Enter Username",
//                         labelText: "UserName",
//                         hintStyle: TextStyle(color: Colors.black26),
//                       ),
//                       onChanged: (val) {
//                         name = "Welcome $val";
//                         setState(() {});
//                       },
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return "Username cannot be empty";
//                         }
//                         return null;
//                       },
//                     ),
//                     TextFormField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                         hintText: "Enter Password",
//                         labelText: "Password",
//                         hintStyle: TextStyle(color: Colors.black26),
//                       ),
//                       validator: (value) {
//                         if (value!.isEmpty) {
//                           return 'Password cannot be blank';
//                         } else if (value.length < 6) {
//                           return 'Password must be at least 6 characters';
//                         }
//                         return null;
//                       },
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     InkWell(
//                       onTap: () => moveToHome(context),
//                       child: AnimatedContainer(
//                         height: 50,
//                         width: changeButton ? 50 : 125,
//                         duration: Duration(seconds: 1),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           borderRadius:
//                               BorderRadius.circular(changeButton ? 35 : 15),
//                           border: Border.all(color: Colors.orangeAccent),
//                         ),
//                         child: changeButton
//                             ? Icon(
//                                 Icons.done,
//                                 color: Colors.orangeAccent,
//                               )
//                             : Text(
//                                 "Login",
//                                 style: TextStyle(
//                                   color: Colors.orangeAccent,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 17,
//                                 ),
//                               ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

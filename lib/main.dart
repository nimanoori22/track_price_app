import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digi/services/authenticate.dart';
import 'package:digi/pages/product_page.dart';
import 'package:digi/pages/post_product_link.dart';
import 'package:digi/pages/signup_page.dart';

void main() {
  runApp(const MaterialApp(
    home: SignUp(),
  ));
}

// class login extends StatefulWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   _loginState createState() => _loginState();
// }
//
// class _loginState extends State<login> {
//
//   String pass='hazard10';
//   String user='nima';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     authenticate(user, pass);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//     );
//   }
// }

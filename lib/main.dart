import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:digi/services/authenticate.dart';
import 'package:digi/pages/product_page.dart';
import 'package:digi/pages/post_product_link.dart';
import 'package:digi/pages/signup_page.dart';
import 'package:digi/services/user.dart';

void main() {

  Widget _defaultHome = const SignUp();

  if(User.isLoggedIn()) {
    _defaultHome = Home();
  }

  runApp( MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.grey
    ),
    home: _defaultHome,
  ));
}


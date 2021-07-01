import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:io';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  Future sendCredentials(String email, String password) async {
    await http.post(
        Uri.parse('http://10.0.2.2:8000/auth/users/'),
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        }),
    );
    http.Response response = await http.post(
      Uri.parse('http://10.0.2.2:8000/auth/token/login'),
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    print(response.body);
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


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

  late String email;
  late String password;

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
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password
      }),
    );
    print(response.body);
  }

  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  // controller: myController,
                  onSaved: (String? value){
                    email = value!;
                  },
                  validator: (value){
                    if(value == null || value.isEmpty) {
                      return 'please enter your email';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'email'
                  ),
                ),
                const SizedBox(height: 10.0,),
                TextFormField(
                  onSaved: (String? value){
                    password = value!;
                  },
                  decoration: const InputDecoration(
                    hintText: 'password'
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){
                        _formKey.currentState!.save();
                        sendCredentials(email, password);
                      }
                    },
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:digi/mysecrets.dart';

class ulrForm extends StatefulWidget {
  const ulrForm({Key? key}) : super(key: key);

  @override
  _ulrFormState createState() => _ulrFormState();
}

class _ulrFormState extends State<ulrForm> {

  Future<http.Response> sendUrl(String url) {
    return http.post(
      Uri.parse('http://10.0.2.2:8000/products/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: secrets['user1']!,
      },
      body: jsonEncode(<String, String>{
        'url': url,
      }),
    );
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
                  controller: myController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return 'please enter the url';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      sendUrl(myController.text);
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}

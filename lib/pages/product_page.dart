import 'package:flutter/material.dart';
import 'package:digi/services/products.dart';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:digi/mysecrets.dart';

class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Future<List<Product>> getProduct() async {

    String myurl =
        "http://10.0.2.2:8000/products";
    List<Product> myModels = [];
    final response = await http.get(Uri.parse(myurl), headers: {
      'Accept': 'application/json',
      'Content-Type': 'charset=utf-8',
      HttpHeaders.authorizationHeader: secrets['user1']!,
    });

    if(response.statusCode == 200 ) {
      myModels = (json.decode(utf8.decode(response.bodyBytes)) as List).map((i) =>
          Product.fromJson(i)).toList();

      return myModels;
    }else {
      throw Exception('Failed to load product list');
    }
  }

  late Future<List<Product>> productList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productList = getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: SingleChildScrollView(
          // padding: const EdgeInsets.all(5.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<List<Product>>(
                    future: productList,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                          primary: false,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                            Product product = snapshot.data![index];
                            return Column(
                              children: [
                                Image.network(product.img!),
                                const SizedBox(height: 5.0,),
                                Text(
                                  // utf8.decode(product.title!.toList()),
                                  product.title!,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                    letterSpacing: 1.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10.0,),
                                Card(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            print('hi');
                                          },
                                          child: const Text('خرید'),
                                          style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(239, 57, 78, 1)
                                          ),
                                        ),
                                        Text(
                                          // product.price!,
                                          product.price!,
                                          style: const TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: ListView.builder(
                                      primary: false,
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: Product.jsonListToDart(product.features!).length,
                                      itemBuilder: (BuildContext context, index){
                                    return Container(
                                      child: Text(Product.jsonListToDart(product.features!)[index]),
                                    );
                                  }),
                                ),
                              ],
                            );
                          },
                        );
                      }else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    }
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
import 'dart:convert';

class Product {

  String? title;
  String? img;
  String? price;
  String? features;

  Product({required this.title,
    required  this.features, required this.price, required this.img});

  factory Product.fromJson(Map<String, dynamic> json) {

    return Product(
        title: json['title'],
        features: json['features'],
        price: json['price'],
        img: json['img']
    );
  }

  static List<String> jsonListToDart(String list) {
    return (jsonDecode(list) as List<dynamic>).cast<String>();
  }

}




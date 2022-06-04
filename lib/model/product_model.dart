import 'package:flutter/foundation.dart';

class Product{
  late String cat;
  late int id;
  late String product_name;
  late String iamge;
  late int price;
  late String description;
  late String restaurant;

  Product({
    required this.cat,
    required this.id,
    required this.description,
    required this.iamge,
    required this.price,
    required this.product_name,
    required this.restaurant
  });

  factory Product.fromJSON(json){
    return Product(
      id: json['id'] as int,
      cat: json['cat_id'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      iamge: json['image_small'] as String,
      product_name: json['item_name'] as String,
      restaurant: json['res_name'] as String,

    );
  }
  static Map<String,dynamic> toJSON(Product product){
    return {
      "id": product.id,
      "res_name": product.restaurant,
      "description": product.description,
      "price": product.price,
      "image_small": product.iamge,
      "cat_id": product.cat,
      "item_name": product.product_name,
    };
  }
}
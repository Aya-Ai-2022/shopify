

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shopify/data/product_data.dart';
class ProductProvider with ChangeNotifier {
  List<Products> _productsList = [];

  List<Products> get productsList => _productsList;

  Future<void> fetchData() async {
    try {
      var dio = Dio();
      var response = await dio.get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?product_type=blush&rating_greater_than=1&image_link=https://d3t32hsnjxo7q6.cloudfront.net/',
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Products> products = data.map((json) => Products.fromJson(json)).toList();
        _productsList = products;
        notifyListeners();
      } else {
        print(response.statusMessage);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }
}

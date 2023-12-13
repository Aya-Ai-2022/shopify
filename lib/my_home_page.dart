// ignore_for_file: avoid_print

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:shopify/data/product_data.dart';
import 'package:shopify/product_detail_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Products> productsList;

  @override
  void initState() {
    super.initState();
    productsList = [];
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      var dio = Dio();
      var response = await dio.get(
        'http://makeup-api.herokuapp.com/api/v1/products.json?product_type=blush&rating_greater_than=1&image_link=https://d3t32hsnjxo7q6.cloudfront.net/',
      );

      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        List<Products> products = data.map((json) => Products.fromJson(json)).toList();
        setState(() {
          productsList = products;
        });
      } else {
        print(response.statusMessage);
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('All Products', style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
      body: CarouselSlider(
        items: productsList.map((product) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailPage(product: product),
                ),
              );
            },
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  product.imageLink,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }).toList(),
        options: CarouselOptions(
          height: 400.0,
          enlargeCenterPage: true,
          autoPlay: true,
          aspectRatio: 16 / 9,
          autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          viewportFraction: 0.8,
        ),
      ),
    );
  }
}

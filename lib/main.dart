import 'package:flutter/material.dart';
import 'package:shopify/my_home_page.dart';





void main() => runApp(  const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Products',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(),
    );
  }
}


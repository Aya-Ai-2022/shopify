import 'package:flutter/material.dart';
import 'package:shopify/auth.dart';
import 'package:shopify/my_home_page.dart';

import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'E-commerce App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}












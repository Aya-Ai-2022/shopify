


import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/bottom_nav.dart';
import 'package:shopify/home_prov.dart';
import 'package:shopify/login_page.dart';
import 'package:shopify/product_caresoual.dart';
import 'package:shopify/product_detail_page.dart';
import 'package:shopify/product_provider.dart';




class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }
}


class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text('All Products', style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
      body: const SplashPage(),
      bottomNavigationBar: const BottomNavigationBarWidget(),
    );
  }
}
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashContent(),
    );
  }
}

class SplashContent extends StatelessWidget {
  const SplashContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductProvider(),
      child: const Column(
        children: [
          Expanded(
            child: ProductCarousel(),
          ),
          GetStartedButton(),
        ],
      ),
    );
  }
}
class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return productProvider.productsList.isEmpty
            ? const SizedBox() // Hide the button when data is loading
            : Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  LoginPage()),
                    );
                  },
                  child: const Text('Get Started'),
                ),
              );
      },
    );
  }
}

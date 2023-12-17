import 'package:flutter/material.dart';
import 'package:shopify/my_home_page.dart';


class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
              BottomNavigationBarItem(
          icon: Icon(Icons.add_shopping_cart),
          label: 'Cart',
        ),
      ],
      currentIndex: 0,
      onTap: (index) {
        // Handle bottom navigation item tap
        const MyHomePage();
      },
    );
  }
}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopify/product_detail_page.dart';
import 'package:shopify/product_provider.dart';

class ProductCarousel extends StatefulWidget {
  const ProductCarousel({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProductCarouselState createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, productProvider, child) {
        return productProvider.productsList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CarouselSlider(  items: productProvider.productsList.map((product) {
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
              );
      },
    );
  }
}

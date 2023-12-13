import 'package:flutter/material.dart';
import 'package:shopify/data/product_data.dart';

class ProductDetailPage extends StatelessWidget {
  final Products product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imageLink,
                height:MediaQuery.of(context).size.height*0.3,
                width: MediaQuery.of(context).size.width*0.7,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Center(child: Text(' ${product.name}', style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
            const SizedBox(height: 8.0),
            Center(child: Text("Price: ${product.price} \$", style: const TextStyle(fontSize: 16.0))),
            const SizedBox(height: 8.0),
            Center(child: Text('Rating: ${product.rating}', style: const TextStyle(fontSize: 16.0))),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}

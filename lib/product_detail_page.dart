import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopify/data/product_data.dart';

class ProductDetailPage extends StatelessWidget {
 
  final Products product;

   const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     ScreenUtil.init(context, designSize: const Size(750, 1334), minTextAdapt: false);
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Product Details'),
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imageLink,
                height:ScreenUtil().screenHeight*0.3,
                width:ScreenUtil().screenHeight*0.7,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16.0),
            Center(child: Text(' ${product.name}', style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))),
            const SizedBox(height: 8.0),
            Center(child: Text("Price: ${product.price} \$", style: const TextStyle(fontSize: 16.0))),
            const SizedBox(height: 8.0),
            Center(child: Text('Rating: ${product.rating}', style: const TextStyle(fontSize: 16.0))),
          ],
        ),
      ),
    );
  }
}

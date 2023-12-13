class Products {
  late int id;
  late String name;
  late String price;
  late String imageLink;
  late double rating;
  late String category;
  late String productType;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    imageLink = json['image_link'];
    rating = json['rating'];
    category = json['category'];
    productType = json['product_type'];
  }
}

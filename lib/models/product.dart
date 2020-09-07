import 'package:delilo/models/review.dart';
import 'package:flutter/foundation.dart';

class Product {
  final String imageUrl;
  final String productName;
  final String shopName;
  final int price;
  final int ratings;
  final List colors;
  final String description;
  final List<Review> reviews;
  final int index;

  Product(
      {@required this.imageUrl,
      @required this.productName,
      @required this.shopName,
      @required this.price,
      @required this.ratings,
      @required this.colors,
      @required this.description,
      @required this.reviews,
      this.index});
}

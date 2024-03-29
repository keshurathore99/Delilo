import 'package:flutter/foundation.dart';

class Product {
  final String imageUrl;
  final String image2;
  final String image3;
  final String image4;
  final String productName;
  final String shopName;
  final int price;
  final double ratings;
  final List colors;
  final String description;
  final List reviews;
  final int index;
  final String productType;
  final String productId;
  final String sellerId;
  final bool inStock;
  final int quantity;

  Product(
      {@required this.imageUrl,
      @required this.productName,
      @required this.shopName,
      @required this.price,
      @required this.ratings,
      @required this.colors,
      @required this.description,
      @required this.reviews,
      @required this.image2,
      @required this.image3,
      @required this.image4,
      @required this.productType,
      @required this.productId,
      @required this.inStock,
      @required this.sellerId,
      this.quantity,
      this.index});
}

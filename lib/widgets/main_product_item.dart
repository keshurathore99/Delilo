import 'package:flutter/material.dart';

class MainProductItem extends StatelessWidget {
  final String productName;
  final String shopName;
  final double price;
  final String imageUrl;

  MainProductItem(
      {@required this.productName,
      @required this.shopName,
      @required this.price,
      @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.blue),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage(
                    'assets/dairy/photo-1524546666497-1c737219eec9.jpeg'),
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
          Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      child: Text(
                        productName,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 8),
                      child: Text(
                        shopName,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        '₹ ' + price.toStringAsFixed(0),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}

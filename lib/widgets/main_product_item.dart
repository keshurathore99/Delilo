import 'package:delilo/models/product.dart';
import 'package:delilo/screens/home/productdetailspage.dart';
import 'package:flutter/material.dart';

class MainProductItem extends StatelessWidget {
  final String productName;
  final String shopName;
  final double price;
  final String imageUrl;
  final int index;
  final Product product;

  MainProductItem(
      {this.productName,
      this.shopName,
      this.price,
      this.imageUrl,
      this.index,
      this.product});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product)));
      },
      child: Card(
        color: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 5,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue),
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
                            horizontal: 8, vertical: 2),
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
      ),
    );
  }
}

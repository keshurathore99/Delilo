import 'package:delilo/models/product.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/home/productdetailspage.dart';
import 'package:flutter/material.dart';

class SecondProductItemForFashionScreen extends StatelessWidget {
  final Product product;
  SecondProductItemForFashionScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product)));
      },
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: FadeInImage(
                height: displayHeight(context) / 2,
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/fashion/fashion7.jpg'),
                image: NetworkImage(product.imageUrl),
              ),
            ),
          ),
          Container(
            width: displayWidth(context) / 2.4,
            padding: EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
                color: Colors.green, borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  product.productName,
                  style: TextStyle(color: Colors.white),
                ),
                Text(product.shopName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                Text('₹ ' + product.price.toString(),
                    style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

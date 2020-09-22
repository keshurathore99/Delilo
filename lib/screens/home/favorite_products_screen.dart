import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/screens/home/productdetailspage.dart';
import 'package:flutter/material.dart';

class FavoriteProductsScreen extends StatelessWidget {
  final userUid;

  FavoriteProductsScreen(this.userUid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Favorites'),
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: Firestore.instance.collection('users').document(userUid).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final favoriteList = snapshot.data.data['favoriteProducts'] as List;

          if (favoriteList == null) {
            return Center(
              child: Text('No Products in Favorites'),
            );
          }

          return ListView.builder(
              itemCount: favoriteList.length,
              itemBuilder: (context, index) {
                return FutureBuilder<DocumentSnapshot>(
                  future:
                      Firestore.instance.document(favoriteList[index]).get(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container();
                    }
                    final product = snapshot.data.data;
                    return FavoriteCard(snapshot.data.data);
                  },
                );
              });
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Map<String, dynamic> product;
  FavoriteCard(this.product);

  @override
  Widget build(BuildContext context) {
    final realProduct = Product(
        imageUrl: product['image1'],
        productName: product['name'],
        shopName: product['shop_name'],
        price: int.parse(product['price']),
        ratings: product['ratings'],
        colors: product['colors'],
        description: product['description'],
        reviews: product['reviews'],
        image2: product['image2'],
        image3: product['image3'],
        image4: product['image4'],
        productType: product['productType'],
        productId: product['productId'],
        inStock: product['inStock'],
        sellerId: product['sellerId']);

    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ProductDetailPage(product: realProduct)));
        },
        leading: FadeInImage(
          image: NetworkImage(realProduct.imageUrl),
          placeholder: AssetImage('assets/images/dellologo.png'),
        ),
        title: Text(realProduct.productName),
        subtitle: Text('Offering By ' + realProduct.shopName),
        trailing: Text('₹ ' + realProduct.price.toString()),
      ),
    );
  }
}

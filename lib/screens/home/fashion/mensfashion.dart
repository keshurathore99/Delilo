import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/buyer%20widgets/category_row.dart';
import 'package:delilo/buyer%20widgets/loading_bar_for_main_tile.dart';
import 'package:delilo/buyer%20widgets/main_product_item.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/models/review.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class MensFashionScreen extends StatefulWidget {
  @override
  _MensFashionScreenState createState() => _MensFashionScreenState();
}

class _MensFashionScreenState extends State<MensFashionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    double height = displayHeight(context);

    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 18.0, 0, 18),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Container(
                      width: width * .8,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          // key: __passwordkey,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Icon(
                                  Icons.search,
                                  size: 35,
                                  color: Colors.green.withOpacity(.75),
                                ),
                              ),
                              hintText: "Search for Products"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              CategoryRow('Suits', 'men', 'suits'),
              FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection('fashion')
                      .document('men')
                      .collection('suits')
                      .limit(10)
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingBarForMainTile();
                    }
                    return Container(
                      width: width,
                      height: height / 2,
                      child: PageView.builder(
                        itemCount: snapshot.data.documents.length,
                        controller: PageController(viewportFraction: 0.4),
                        itemBuilder: (_, i) {
                          final snap = snapshot.data.documents[i].data;

                          final product = Product(
                              sellerId: snap['sellerId'],
                              inStock: snap['inStock'],
                              productId: snap['productId'],
                              productType: snap['productType'],
                              imageUrl: snap['image1'],
                              image2: snap['image2'],
                              image3: snap['image3'],
                              image4: snap['image4'],
                              productName: snap['name'],
                              shopName: snap['shop_name'],
                              price: int.parse(snap['price']),
                              ratings: 4.8,
                              colors: [Colors.black],
                              description: snap['description'],
                              reviews: snap['reviews']);

                          return Transform.scale(
                            scale: 1,
                            child: MainProductItem(
                              product: product,
                            ),
                          );
                        },
                      ),
                    );
                  }),
              CategoryRow('Shirts', 'men', 'shirts'),
              FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection('fashion')
                      .document('men')
                      .collection('shirts')
                      .limit(10)
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingBarForMainTile();
                    }
                    return Container(
                      width: width,
                      height: height / 2,
                      child: PageView.builder(
                        itemCount: snapshot.data.documents.length,
                        controller: PageController(viewportFraction: 0.4),
                        itemBuilder: (_, i) {
                          final snap = snapshot.data.documents[i].data;
                          final product = Product(
                              sellerId: snap['sellerId'],
                              inStock: snap['inStock'],
                              productId: snap['productId'],
                              productType: snap['productType'],
                              imageUrl: snap['image1'],
                              image2: snap['image2'],
                              image3: snap['image3'],
                              image4: snap['image4'],
                              productName: snap['name'],
                              shopName: snap['shop_name'],
                              price: int.parse(snap['price']),
                              ratings: 4.5,
                              colors: [Colors.black],
                              description: snap['description'],
                              reviews: snap['reviews']);

                          return Transform.scale(
                              scale: 1,
                              child: MainProductItem(
                                product: product,
                              ));
                        },
                      ),
                    );
                  }),
              CategoryRow('T-Shirts', 'men', 'tshirts'),
              FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection('fashion')
                      .document('men')
                      .collection('tshirts')
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingBarForMainTile();
                    }
                    return Container(
                      width: width,
                      height: height / 2,
                      child: PageView.builder(
                        itemCount: snapshot.data.documents.length,
                        controller: PageController(viewportFraction: 0.4),
                        itemBuilder: (_, i) {
                          final snap = snapshot.data.documents[i].data;
                          final product = Product(
                              sellerId: snap['sellerId'],
                              inStock: snap['inStock'],
                              productId: snap['productId'],
                              productType: snap['productType'],
                              imageUrl: snap['image1'],
                              image2: snap['image2'],
                              image3: snap['image3'],
                              image4: snap['image4'],
                              productName: snap['name'],
                              shopName: snap['shop_name'],
                              price: int.parse(snap['price']),
                              ratings: 4.1,
                              colors: [Colors.black],
                              description: snap['description'],
                              reviews: snap['reviews']);

                          return Transform.scale(
                              scale: 1,
                              child: MainProductItem(
                                product: product,
                              ));
                        },
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

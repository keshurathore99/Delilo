import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/buyer%20widgets/category_row.dart';
import 'package:delilo/buyer%20widgets/loading_bar_for_main_tile.dart';
import 'package:delilo/buyer%20widgets/main_product_item.dart';
import 'package:delilo/models/product.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class KidsFashionScreen extends StatefulWidget {
  @override
  _KidsFashionScreenState createState() => _KidsFashionScreenState();
}

class _KidsFashionScreenState extends State<KidsFashionScreen> {
  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
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
              CategoryRow('Baby Cloths', 'kids', 'baby'),
              FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection('fashion')
                      .document('kids')
                      .collection('baby')
                      .limit(10)
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingBarForMainTile();
                    }
                    return Container(
                      width: width,
                      height: displayHeight(context) / 2,
                      child: PageView.builder(
                        itemCount: snapshot.data.documents.length,
                        controller: PageController(viewportFraction: 0.4),
                        itemBuilder: (_, i) {
                          final snap = snapshot.data.documents[i].data;
                          final product = Product(
                              sellerId: snap['sellerId'],
                              productId: snap['productId'],
                              productType: snap['productType'],
                              imageUrl: snap['image1'],
                              productName: snap['name'],
                              shopName: snap['shop_name'],
                              price: int.parse(snap['price']),
                              ratings: 4.5,
                              colors: [Colors.black],
                              description: snap['description'],
                              reviews: snap['reviews'],
                              image2: snap['image2'],
                              image3: snap['image3'],
                              image4: snap['image4'],
                              inStock: snap['inStock']);

                          return Transform.scale(
                              scale: 1,
                              child: MainProductItem(
                                product: product,
                              ));
                        },
                      ),
                    );
                  }),
              CategoryRow('Girl Kids', 'kids', 'girls'),
              FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection('fashion')
                      .document('kids')
                      .collection('girls')
                      .limit(10)
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingBarForMainTile();
                    }
                    return Container(
                      width: width,
                      height: displayHeight(context) / 2,
                      child: PageView.builder(
                        itemCount: snapshot.data.documents.length,
                        controller: PageController(viewportFraction: 0.4),
                        itemBuilder: (_, i) {
                          final snap = snapshot.data.documents[i].data;

                          final product = Product(
                              sellerId: snap['sellerId'],
                              productId: snap['productId'],
                              productType: snap['productType'],
                              imageUrl: snap['image1'],
                              productName: snap['name'],
                              shopName: snap['shop_name'],
                              price: int.parse(snap['price']),
                              ratings: 4.3,
                              colors: [Colors.black],
                              description: snap['description'],
                              reviews: snap['reviews'],
                              image2: snap['image2'],
                              image3: snap['image3'],
                              image4: snap['image4'],
                              inStock: snap['inStock']);

                          return Transform.scale(
                              scale: 1,
                              child: MainProductItem(
                                product: product,
                              ));
                        },
                      ),
                    );
                  }),
              CategoryRow('Boy Kids', 'kids', 'boys'),
              FutureBuilder<QuerySnapshot>(
                  future: Firestore.instance
                      .collection('fashion')
                      .document('kids')
                      .collection('boys')
                      .limit(10)
                      .getDocuments(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingBarForMainTile();
                    }
                    return Container(
                      width: width,
                      height: displayHeight(context) / 2,
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
                              productName: snap['name'],
                              shopName: snap['shop_name'],
                              price: int.parse(snap['price']),
                              ratings: 4.9,
                              colors: [Colors.black],
                              description: snap['description'],
                              reviews: snap['reviews'],
                              image3: snap['image3'],
                              image2: snap['image2'],
                              image4: snap['image4']);

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

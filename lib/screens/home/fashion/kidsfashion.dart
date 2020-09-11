import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/models/review.dart';
import 'package:delilo/widgets/category_row.dart';
import 'package:delilo/widgets/main_product_item.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class KidsFashionScreen extends StatefulWidget {
  @override
  _KidsFashionScreenState createState() => _KidsFashionScreenState();
}

class _KidsFashionScreenState extends State<KidsFashionScreen> {
//  int _babyIndex = 0;
//  int _boysIndex = 0;
//  int _girlsIndex = 0;

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
                      return Container(
                        height: displayHeight(context) / 2,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Container(
                      width: width,
                      height: displayHeight(context) / 2,
                      child: PageView.builder(
                        itemCount: snapshot.data.documents.length,
                        controller: PageController(viewportFraction: 0.4),
                        itemBuilder: (_, i) {
                          final String productName =
                              snapshot.data.documents[i].data['name'];
                          final String shopName =
                              snapshot.data.documents[i].data['shop_name'];
                          final String price =
                              snapshot.data.documents[i].data['price'];
                          final String description =
                              snapshot.data.documents[i].data['description'];
                          final reviews = snapshot
                              .data.documents[i].data['reviews'] as List;
                          final productImage =
                              snapshot.data.documents[i].data['image1'];
                          final List<Review> reviewList = [];

                          for (var review in reviews) {
                            final reviewModel = Review(
                                name: review['name'],
                                rating:
                                    double.parse(review['rating'].toString()),
                                imageUrl:
                                    'data:image/png;base64,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',
                                reviewComment: review['review']);
                            reviewList.add(reviewModel);
                          }

                          final product = Product(
                              imageUrl: productImage,
                              productName: productName,
                              shopName: shopName,
                              price: int.parse(price),
                              ratings: 4.5,
                              colors: [Colors.black],
                              description: description,
                              reviews: reviewList);

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
                      return Container(
                        height: displayHeight(context) / 2,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Container(
                      width: width,
                      height: displayHeight(context) / 2,
                      child: PageView.builder(
                        itemCount: snapshot.data.documents.length,
                        controller: PageController(viewportFraction: 0.4),
                        itemBuilder: (_, i) {
                          final String productName =
                              snapshot.data.documents[i].data['name'];
                          final String shopName =
                              snapshot.data.documents[i].data['shop_name'];
                          final String price =
                              snapshot.data.documents[i].data['price'];
                          final String description =
                              snapshot.data.documents[i].data['description'];
                          final reviews = snapshot
                              .data.documents[i].data['reviews'] as List;
                          final productImage =
                              snapshot.data.documents[i].data['image1'];
                          final List<Review> reviewList = [];

                          for (var review in reviews) {
                            final reviewModel = Review(
                                name: review['name'],
                                rating:
                                    double.parse(review['rating'].toString()),
                                imageUrl:
                                    'data:image/png;base64,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',
                                reviewComment: review['review']);
                            reviewList.add(reviewModel);
                          }

                          final product = Product(
                              imageUrl: productImage,
                              productName: productName,
                              shopName: shopName,
                              price: int.parse(price),
                              ratings: 4.3,
                              colors: [Colors.black],
                              description: description,
                              reviews: reviewList);

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
                      Container(
                        height: displayHeight(context) / 2,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return Container(
                      width: width,
                      height: displayHeight(context) / 2,
                      child: PageView.builder(
                        itemCount: snapshot.data.documents.length,
                        controller: PageController(viewportFraction: 0.4),
                        itemBuilder: (_, i) {
                          final String productName =
                              snapshot.data.documents[i].data['name'];
                          final String shopName =
                              snapshot.data.documents[i].data['shop_name'];
                          final String price =
                              snapshot.data.documents[i].data['price'];
                          final String description =
                              snapshot.data.documents[i].data['description'];
                          final reviews = snapshot
                              .data.documents[i].data['reviews'] as List;
                          final productImage =
                              snapshot.data.documents[i].data['image1'];

                          final List<Review> reviewList = [];

                          for (var review in reviews) {
                            final reviewModel = Review(
                                name: review['name'],
                                rating:
                                    double.parse(review['rating'].toString()),
                                imageUrl:
                                    'data:image/png;base64,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',
                                reviewComment: review['review']);
                            reviewList.add(reviewModel);
                          }

                          final product = Product(
                              imageUrl: productImage,
                              productName: productName,
                              shopName: shopName,
                              price: int.parse(price),
                              ratings: 4.9,
                              colors: [Colors.black],
                              description: description,
                              reviews: reviewList);

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

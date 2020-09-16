import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/seller/home/newproductpage.dart';
import 'package:delilo/screens/seller/home/out_of_stock_screen_for_single_category.dart';
import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:delilo/screens/seller/home/sellerhomesceen.dart';
import 'package:delilo/seller%20widgets/category_listing_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SellerCategoryListing extends StatefulWidget {
  final List uploadedProducts;
  final String productType;
  SellerCategoryListing({@required this.uploadedProducts, this.productType});

  @override
  _SellerCategoryListingState createState() => _SellerCategoryListingState();
}

class _SellerCategoryListingState extends State<SellerCategoryListing> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: RaisedButton(
        color: Colors.green,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => NewProductPage()));
        },
        child: Text('Add Product'),
      ),
      key: _scaffoldKey,
      drawer: SellerDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Selected Category",
          style: TextStyle(color: Colors.black),
        ),
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset('assets/u.png'),
          );
        }),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  FlatButton(
                    child: Text('All Items'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textColor: Colors.green,
                    color: Colors.green.withOpacity(0.2),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SellerCategoryListing(
                              uploadedProducts: widget.uploadedProducts)));
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FlatButton(
                    child: Text('Out of Stock'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textColor: Colors.black87,
                    color: Colors.black12,
                    onPressed: () async {
                      final user = await FirebaseAuth.instance.currentUser();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => OutOfScreenForSingleCategory(
                              widget.uploadedProducts,
                              user.uid,
                              widget.productType)));
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.uploadedProducts.length,
                itemBuilder: (context, index) {
                  return FutureBuilder<DocumentSnapshot>(
                      future: Firestore.instance
                          .document(widget.uploadedProducts[index])
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container();
                        }
                        final snap = snapshot.data.data;
                        return CategoryListingTile(
                            snap, widget.uploadedProducts[index], _scaffoldKey);
                      });
                }),
          ),
        ],
      ),
    );
  }
}

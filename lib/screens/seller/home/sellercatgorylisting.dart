import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/seller/home/newproductpage.dart';
import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:delilo/seller%20widgets/category_listing_tile.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class SellerCategoryListing extends StatefulWidget {
  final List uploadedProducts;
  SellerCategoryListing({@required this.uploadedProducts});

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
      body: ListView.builder(
          itemCount: widget.uploadedProducts.length,
          itemBuilder: (context, index) {
            return FutureBuilder<DocumentSnapshot>(
                future: Firestore.instance
                    .document(widget.uploadedProducts[index])
                    .get(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container();
                  }
                  final snap = snapshot.data.data;
                  return CategoryListingTile(
                      snap, widget.uploadedProducts[index], _scaffoldKey);
                });
          }),
    );
  }
}

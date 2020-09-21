import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/seller/home/sellercatgorylisting.dart';
import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:delilo/seller%20widgets/category_listing_tile.dart';
import 'package:flutter/material.dart';

class OutOfScreenForSingleCategory extends StatefulWidget {
  final List uploadedProducts;
  final String userUid;
  final String productType;
  OutOfScreenForSingleCategory(
      this.uploadedProducts, this.userUid, this.productType);

  @override
  _OutOfScreenForSingleCategoryState createState() =>
      _OutOfScreenForSingleCategoryState();
}

class _OutOfScreenForSingleCategoryState
    extends State<OutOfScreenForSingleCategory> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                FlatButton(
                  child: Text('All Items'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.black87,
                  color: Colors.black12,
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
                  textColor: Colors.green,
                  color: Colors.green.withOpacity(0.2),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<DocumentSnapshot>(
              future: Firestore.instance
                  .collection('sellers')
                  .document(widget.userUid)
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                final productList = snapshot.data.data['products'] as List;
                final List<String> realList = [];

                productList.forEach((element) {
                  if (element.toString().contains(widget.productType)) {
                    realList.add(element);
                  }
                });

                return ListView.builder(
                    itemCount: realList.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder<DocumentSnapshot>(
                          future: Firestore.instance
                              .document(realList[index])
                              .get(),
                          builder: (context, smallShot) {
                            if (smallShot.connectionState ==
                                ConnectionState.waiting) {
                              return Container();
                            }
                            if (smallShot.data.data['inStock'] == false)
                              return CategoryListingTile(smallShot.data.data,
                                  realList[index], _scaffoldKey);
                            return Container();
                          });
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}

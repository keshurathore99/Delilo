import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/buyer%20widgets/main_product_item.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BeautyMainScreen extends StatefulWidget {
  @override
  _BeautyMainScreenState createState() => _BeautyMainScreenState();
}

class _BeautyMainScreenState extends State<BeautyMainScreen> {
  final _searchController = TextEditingController();
  List<DocumentSnapshot> _productsList;
  List<DocumentSnapshot> _realList = [];

  @override
  Widget build(BuildContext context) {
    final width = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Container(
              width: width * .8,
              height: 45,
              child: Material(
                elevation: 5,
                shape: StadiumBorder(),
                child: TextFormField(
                  onFieldSubmitted: (searchText) {
                    if (_realList.length > 0) _realList = [];
                    _productsList.forEach((product) {
                      if (product.data['name']
                          .toString()
                          .toLowerCase()
                          .contains(searchText.toLowerCase())) {
                        _realList.add(product);
                      }
                    });
                  },
                  controller: _searchController,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              BorderSide(color: Colors.green, width: 1)),
                      contentPadding: EdgeInsets.all(0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(width: 4, color: Colors.green),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
          ),
          centerTitle: true,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.green,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: FutureBuilder<QuerySnapshot>(
            future: Firestore.instance.collection('beauty').getDocuments(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (!snapshot.hasData || snapshot.data.documents.length == 0) {
                return Center(
                  child: Text(
                    'No Data Available',
                    style: TextStyle(color: Colors.black87),
                  ),
                );
              }

              _productsList = snapshot.data.documents;

              if (_realList.length == 0 && _searchController.text.isNotEmpty) {
                return Center(
                  child: Text('No Results Found'),
                );
              }

              return GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio:
                      displayWidth(context) / displayHeight(context),
                  children: _realList.length == 0
                      ? snapshot.data.documents
                          .map(
                            (product) => MainProductItem(
                                product: Product(
                                    sellerId: product.data['sellerId'],
                                    inStock: product.data['inStock'],
                                    productId: product.data['productId'],
                                    productType: product.data['productType'],
                                    imageUrl: product.data['image1'],
                                    image2: product.data['image2'],
                                    image3: product.data['image3'],
                                    image4: product.data['image4'],
                                    productName: product.data['name'],
                                    shopName: product.data['shop_name'],
                                    price: int.parse(
                                        product.data['price'].toString()),
                                    ratings: product.data['ratings'] == null
                                        ? 0.0
                                        : product.data['ratings'],
                                    colors: [Colors.black],
                                    description: product.data['description'],
                                    reviews: product.data['reviews'])),
                          )
                          .toList()
                      : _realList
                          .map(
                            (product) => MainProductItem(
                                product: Product(
                                    sellerId: product.data['sellerId'],
                                    inStock: product.data['inStock'],
                                    productId: product.data['productId'],
                                    productType: product.data['productType'],
                                    imageUrl: product.data['image1'],
                                    image2: product.data['image2'],
                                    image3: product.data['image3'],
                                    image4: product.data['image4'],
                                    productName: product.data['name'],
                                    shopName: product.data['shop_name'],
                                    price: int.parse(
                                        product.data['price'].toString()),
                                    ratings: product.data['ratings'] == null
                                        ? 0.0
                                        : product.data['ratings'],
                                    colors: [Colors.black],
                                    description: product.data['description'],
                                    reviews: product.data['reviews'])),
                          )
                          .toList());
            }),
      ),
    );
  }
}

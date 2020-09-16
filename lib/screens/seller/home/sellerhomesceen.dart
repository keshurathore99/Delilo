import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/seller/home/newproductpage.dart';
import 'package:delilo/screens/seller/home/sellercatgorylisting.dart';
import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:delilo/seller%20widgets/category_listing_tile.dart';
import 'package:delilo/seller%20widgets/seller_home_screen_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class SellerHomeScreen extends StatefulWidget {
  final String userUid;
  SellerHomeScreen({@required this.userUid});

  @override
  _SellerHomeScreenState createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  @override
  Widget build(BuildContext context) {
//    FirebaseAuth.instance.signOut();
    double wid = displayWidth(context);
    return Scaffold(
      drawer: SellerDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "MENU",
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
      body: FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance
              .collection('sellers')
              .document(widget.userUid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final sellerProducts = snapshot.data.data['products'] as List;
            if (sellerProducts.length == 0) {
              return Center(
                child: Text(
                  'No Products Till Now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }
            final fashionList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('fashion'))
                .toList();

            final mobileList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('mobile'))
                .toList();

            final beautyList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('beauty'))
                .toList();

            final dairyList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('dairy'))
                .toList();

            final householdList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('household'))
                .toList();

            final sportsList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('sport'))
                .toList();

            final toysList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('toys'))
                .toList();

            final travelList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('travel'))
                .toList();

            final partyList = sellerProducts
                .where((element) =>
                    element.toString().toLowerCase().contains('party'))
                .toList();

            return Center(
              child: Container(
                width: wid * .95,
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: 35,
                            width: wid * .25,
                            child: FlatButton(
                                onPressed: () {},
                                child: Text(
                                  "All Items",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ))),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: 35,
                            width: wid * .25,
                            child: FlatButton(
                                onPressed: () async {
                                  final user =
                                      await FirebaseAuth.instance.currentUser();
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OutOfStock(
                                                userUid: user.uid,
                                              )),
                                      (route) => false);
                                },
                                child: Text(
                                  "Out Of Stock",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ))),
                      ],
                    ),
                    fashionList.length == 0
                        ? Container()
                        : SellerHomeScreenCard('Fashion', fashionList.length,
                            fashionList, 'fashion'),
                    mobileList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Mobile', mobileList.length, mobileList, 'mobile'),
                    dairyList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Dairy', dairyList.length, dairyList, 'dairy'),
                    beautyList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Beauty', beautyList.length, beautyList, 'beauty'),
                    householdList.length == 0
                        ? Container()
                        : SellerHomeScreenCard('Household',
                            householdList.length, householdList, 'household'),
                    sportsList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Sports', sportsList.length, sportsList, 'sports'),
                    toysList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Toys', toysList.length, toysList, 'toys'),
                    partyList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Party', partyList.length, partyList, 'party'),
                    travelList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Travel', travelList.length, travelList, 'travel'),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class OutOfStock extends StatefulWidget {
  final userUid;
  OutOfStock({@required this.userUid});

  @override
  _OutOfStockState createState() => _OutOfStockState();
}

class _OutOfStockState extends State<OutOfStock> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: SellerDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Menu",
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
      body: Center(
        child: Container(
          width: wid * .95,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200].withOpacity(.5),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 35,
                      width: wid * .25,
                      child: FlatButton(
                          onPressed: () async {
                            final user =
                                await FirebaseAuth.instance.currentUser();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SellerHomeScreen(userUid: user.uid)),
                                (route) => false);
                          },
                          child: Text(
                            "All Items",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ))),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 35,
                      width: wid * .25,
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Out Of Stock",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ))),
                ],
              ),
              Expanded(
                child: FutureBuilder<DocumentSnapshot>(
                    future: Firestore.instance
                        .collection('sellers')
                        .document(widget.userUid)
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      final productList =
                          snapshot.data.data['products'] as List;

                      if (productList.length == 0) {
                        return Center(
                          child: Text('No Products Are Out Of Stock'),
                        );
                      }

                      return ListView.builder(
                        itemBuilder: (context, index) {
                          return FutureBuilder<DocumentSnapshot>(
                              future: Firestore.instance
                                  .document(productList[index])
                                  .get(),
                              builder: (context, smallShot) {
                                if (smallShot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                }

                                if (smallShot.data.data['inStock'] == false)
                                  return CategoryListingTile(
                                      smallShot.data.data,
                                      productList[index],
                                      _scaffoldKey);
                                return Container();
                              });
                        },
                        itemCount: productList.length,
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

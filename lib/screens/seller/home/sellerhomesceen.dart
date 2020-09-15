import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/seller/home/newproductpage.dart';
import 'package:delilo/screens/seller/home/sellercatgorylisting.dart';
import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:delilo/seller%20widgets/seller_home_screen_card.dart';
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
                                color: Colors.green.withOpacity(.5),
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
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OutOfStock()),
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
                        : SellerHomeScreenCard(
                            'Fashion', fashionList.length, fashionList),
                    mobileList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Mobile', mobileList.length, mobileList),
                    dairyList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Dairy', dairyList.length, dairyList),
                    beautyList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Beauty', beautyList.length, beautyList),
                    householdList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Household', householdList.length, householdList),
                    sportsList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Sports', sportsList.length, sportsList),
                    toysList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Toys', toysList.length, toysList),
                    partyList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Party', partyList.length, partyList),
                    travelList.length == 0
                        ? Container()
                        : SellerHomeScreenCard(
                            'Travel', travelList.length, travelList),
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class OutOfStock extends StatefulWidget {
  @override
  _OutOfStockState createState() => _OutOfStockState();
}

class _OutOfStockState extends State<OutOfStock> {
  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
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
            child: Image.asset('assets/images/u.png'),
          );
        }),
      ),
      body: Center(
        child: Container(
          width: wid * .95,
          child: ListView(
            children: [
              Text(
                "Design has been updated for Seller Flow from previous PDF document \n The Design implemented is the new & Aceepted design",
                style: TextStyle(color: Colors.red),
              ),
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
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/sellerhome', (route) => false);
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
                          onPressed: () {
                            /*Navigator.pushNamed(context, '/sellerhome');*/
                          },
                          child: Text(
                            "Out Of Stock",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ))),
                ],
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 100,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/Union1.png'),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Item 1",
                            style: TextStyle(color: Colors.green),
                          ),
                          // Text("122 Items"),
                        ],
                      ),
                      Align(alignment: Alignment(1, -.8), child: Text("EDIT")),
                    ],
                  )),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 100,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/Union1.png'),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Item 2",
                            style: TextStyle(color: Colors.green),
                          ),
                          //Text("90 Items"),
                        ],
                      ),
                      Align(alignment: Alignment(1, -.8), child: Text("EDIT")),
                    ],
                  )),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 100,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/Union1.png'),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Item 3",
                            style: TextStyle(color: Colors.green),
                          ),
                          // Text("50 Items"),
                        ],
                      ),
                      Align(alignment: Alignment(1, -.8), child: Text("EDIT")),
                    ],
                  )),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Container(
                  height: 100,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/Union1.png'),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Item 4",
                            style: TextStyle(color: Colors.green),
                          ),
                          //Text("20 Items"),
                        ],
                      ),
                      Align(alignment: Alignment(1, -.8), child: Text("EDIT")),
                    ],
                  )),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              /* Padding(
                padding: const EdgeInsets.only(top:58.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(decoration: BoxDecoration(color: Colors.green[700],borderRadius: BorderRadius.all(Radius.circular(30))),height: 55,width:wid*.75,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/sellerhome');}, child: Text("Add New",style: TextStyle(color: Colors.white,fontSize: 20),))),
                  ],
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}

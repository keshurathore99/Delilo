import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/home/beauty_and_health/beauty_main_screen.dart';
import 'package:delilo/screens/home/dairy/dairy_main_screen.dart';
import 'package:delilo/screens/home/fashion/fashionmain.dart';
import 'package:delilo/screens/home/household/household_main_screen.dart';
import 'package:delilo/screens/home/mobile/mobile_main_screen.dart';
import 'package:delilo/screens/home/nearby_markets.dart';
import 'package:delilo/screens/home/orders.dart';
import 'package:delilo/screens/home/party/party_main_screen.dart';
import 'package:delilo/screens/home/sports/sports_main_screen.dart';
import 'package:delilo/screens/home/toys_and_baby_products/toys_and_baby_main_screen.dart';
import 'package:delilo/screens/home/travel/travel_main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'menu_item_tile.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String userUid;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((value) {
      setState(() {
        userUid = value.uid;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.green,
            child: DrawerHeader(
                child: Center(
              child: Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment(-1, -1),
                        child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.close))),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                      child: Center(
                        child: Row(
                          children: [
                            Icon(
                              Icons.person_pin,
                              size: 70,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                FutureBuilder<FirebaseUser>(
                                    future: FirebaseAuth.instance.currentUser(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return Text(
                                          'Loading',
                                          style: TextStyle(color: Colors.white),
                                        );
                                      }
                                      return FutureBuilder<DocumentSnapshot>(
                                          future: Firestore.instance
                                              .collection('users')
                                              .document(snapshot.data.uid)
                                              .get(),
                                          builder: (context, smallShot) {
                                            if (smallShot.connectionState ==
                                                ConnectionState.waiting) {
                                              return Text('Loading');
                                            }
                                            return Text(
                                              'xxxxxxxx',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            );
                                          });
                                    }),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 15, 0, 0),
                                  child: Text(
                                    "Gold Member",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Align(
                          alignment: Alignment(1, 1),
                          child: Text(
                            "Rate Us",
                            style: TextStyle(
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          )),
                    ),
                  ],
                ),
              ),
            )),
          ),
          MenuItemTile(MobileMainScreen(), 'Mobiles',
              'assets/Icon awesome-mobile-alt.png'),
          MenuItemTile(FashionMainPage(), 'Fashion', 'assets/Group 418.png'),
          MenuItemTile(HouseholdMainScreen(), 'Household', 'assets/lamp.png'),
          MenuItemTile(
              BeautyMainScreen(), 'Beauty And Health', 'assets/Group 419.png'),
          MenuItemTile(ToysAndBabyProducts(), 'Toys & Baby Products',
              'assets/Group 424.png'),
          MenuItemTile(
              NearbyMarkets(), 'Nearby Markets', 'assets/Group 420.png'),
          MenuItemTile(
              DairyMainScreen(), 'Dairy Products', 'assets/Group 421.png'),
          MenuItemTile(
              SportsMainScreen(), 'Sports & More', 'assets/Group 422.png'),
          MenuItemTile(
              PartyMainScreen(), 'Party & Gatherings', 'assets/Group 423.png'),
          MenuItemTile(TravelMainScreen(), 'Travel & Explore',
              'assets/Icon material-card-travel.png'),
          MenuItemTile(
              OrdersPage(
                userUid: userUid,
              ),
              'Orders',
              'assets/Group 408.png'),
          MenuItemTile(
              FashionMainPage(), 'History', 'assets/Icon material-history.png'),
          MenuItemTile(FashionMainPage(), 'Coupons', 'assets/%.png'),
          MenuItemTile(FashionMainPage(), 'Be A Seller',
              'assets/Icon ionic-ios-person-add.png'),
          MenuItemTile(FashionMainPage(), 'Customer Support',
              'assets/Icon ionic-ios-person-add.png'),
        ],
      ),
    );
  }
}

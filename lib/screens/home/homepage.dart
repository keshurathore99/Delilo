import 'package:carousel_images/carousel_images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/seller_model.dart';
import 'package:delilo/screens/home/account.dart';
import 'package:delilo/screens/home/cart.dart';
import 'file:///C:/Users/lenovo/Desktop/Delilo/lib/widgets/drawer.dart';
import 'package:delilo/widgets/seller_card_for_homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:geolocator/geolocator.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _index = 0;
  String uid;

  @override
  Widget build(BuildContext context) {
//    FirebaseAuth.instance.signOut();
//    Firestore.instance
//        .collection('shops')
//        .document('jdndbaaysdbdejsjns')
//        .setData({
//      'shopName': 'Batra Shop',
//      'shopCategory': 'Electric',
//      'latitude': 65.66,
//      'longitude': -18.00,
//      'stars': 4.0,
//      'imageUrl':
//          'https://static.toiimg.com/thumb/72975551.cms?width=680&height=512&imgsize=881753',
//    });
    Widget child;
    FirebaseAuth.instance.currentUser().then((value) => uid = value.uid);

    switch (_index) {
      case 0:
        child = MainHomeScreen();
        break;
      case 1:
        child = CartPage(
          userUid: uid,
        );
        break;
      case 2:
        child = AccountInfo(
          userUid: uid,
        );
        break;
    }

    return Scaffold(
        drawer: MyDrawer(),
        body: child,
        bottomNavigationBar: bottomNavigationBar());
  }

  Widget bottomNavigationBar() {
    return ClipRRect(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(15), topLeft: Radius.circular(15)),
      child: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Container(),
          ),
        ],
      ),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  @override
  _MainHomeScreenState createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final width = displayWidth(context);
    return Scaffold(
      appBar: homeScreenAppBar(),
      body: FutureBuilder<List<Seller>>(
          future: fetchShops(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * .8,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            enableInteractiveSelection: true,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(0),
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
                                hintText: "Search from Products, Shops"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                FutureBuilder<DocumentSnapshot>(
                    future: Firestore.instance
                        .collection('corousel_images')
                        .document('images')
                        .get(),
                    builder: (context, smallShot) {
                      if (smallShot.connectionState ==
                          ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final List<String> images = [];
                      (smallShot.data.data['images'] as List)
                          .forEach((element) {
                        images.add(element);
                      });
                      return CarouselImages(
                        scaleFactor: 1,
                        listImages: images,
                        height: displayHeight(context) * 0.15,
                        borderRadius: 5,
                        cachedNetworkImage: true,
                        verticalAlignment: Alignment.topCenter,
                        onTap: (index) {
                          print('Tapped on page $index');
                        },
                      );
                    }),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          'Nearby Shops',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                    Expanded(child: Container()),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return SellerCardForHomeScreen(
                              shopName: snapshot.data[index].shopName,
                              shopCategory: snapshot.data[index].shopCategory,
                              distance: snapshot.data[index].distance,
                              stars: snapshot.data[index].stars,
                              imageUrl: snapshot.data[index].imageUrl);
                        })),
              ],
            );
          }),
    );
  }

  Future<List<Seller>> fetchShops() async {
    final myPosition = await GeolocatorPlatform.instance.getCurrentPosition();
    final myLatitude = myPosition.latitude;
    final myLongitude = myPosition.longitude;

    List<Seller> list = [];

    final snapshot =
        await Firestore.instance.collection('shops').getDocuments();
    for (var snap in snapshot.documents) {
      final latitude = snap.data['latitude'] as double;
      final longitude = snap.data['longitude'] as double;

      final distance =
          getDistance(myLatitude, myLongitude, latitude, longitude);

      final seller = Seller(snap.data['shopName'], snap.data['shopCategory'],
          distance, snap.data['imageUrl'], snap.data['stars']);

      list.add(seller);
    }

    list.sort((a, b) => a.distance.compareTo(b.distance));
    return list;
  }

  double getDistance(double myLatitude, double myLongitude, double latitude,
      double longitude) {
    final distanceInMetre = GeolocatorPlatform.instance
        .distanceBetween(myLatitude, myLongitude, latitude, longitude);
    return distanceInMetre / 1000;
  }

  Widget homeScreenAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0),
      child: AppBar(
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset('assets/u.png'),
          );
        }), //GestureDetector(child: Image.asset('assets/images/u.png'),onTap: (){Scaffold.of(context).openDrawer();},),
        centerTitle: true,
        title: Container(
            height: 100,
            width: 140,
            child: Image.asset('assets/dellologo.png')),
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(
              Icons.notifications,
              color: Colors.green,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/seller_model.dart';
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
  @override
  Widget build(BuildContext context) {
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

    double width = displayWidth(context);
    return Scaffold(
        drawer: MyDrawer(),
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
                              // key: __passwordkey,
                              enableInteractiveSelection: true,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(width: 4),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
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
                              validator: (value) {},
                            ),
                          ),
                        ),
                      ],
                    ),
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
        bottomNavigationBar: bottomNavigationBar());
  }

  BottomNavigationBar bottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.green,
      selectedItemColor: Colors.white,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(28))),
              child: Icon(
                Icons.home,
                color: Colors.green,
              )),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/cart');
            },
            child: Container(
                height: 50,
                width: 50,
                /*decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),*/
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
          ),
          title: Container(),
        ),
        BottomNavigationBarItem(
          icon: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/accountinfo');
            },
            child: Container(
                height: 50,
                width: 50,
                /* decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),*/
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                )),
          ),
          title: Container(),
        ),
      ],
    );
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
            height: 100, width: 140, child: Image.asset('assets/j.png')),
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
}

import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/seller/home/orderpage.dart';
import 'package:delilo/screens/seller/home/payin.dart';
import 'package:delilo/screens/seller/home/sellerhomesceen.dart';
import 'package:delilo/screens/seller/home/sellerprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SellerDrawer extends StatefulWidget {
  final String sellerUid;
  SellerDrawer({@required this.sellerUid});

  @override
  _SellerDrawerState createState() => _SellerDrawerState();
}

class _SellerDrawerState extends State<SellerDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) / 2,
      child: Drawer(
        child: ListView(
          children: [
            Container(
              color: Colors.green,
              height: 150,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_pin,
                      size: 60,
                    ),
                    Text("xxxxxx"),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SellerOrdersPage(sellerUid: widget.sellerUid)));
              },
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                  "Order",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SellerHomeScreen(userUid: widget.sellerUid)));
              },
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                  "Menu",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            InkWell(
              onTap: () async {
                final user = await FirebaseAuth.instance.currentUser();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PayinPage(
                              sellerUid: user.uid,
                            )));
              },
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                  "Pay In",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SellerProfile()));
              },
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                  "Profile",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Container(
                height: 50,
                child: Center(
                    child: Text(
                  "Sign Out",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

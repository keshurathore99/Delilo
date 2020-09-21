import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/seller/home/edit_bank_details_screen.dart';
import 'package:delilo/screens/seller/home/edit_business_details_screen.dart';
import 'package:delilo/screens/seller/home/profile_edit_screen.dart';
import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:delilo/screens/seller/home/sellerhomesceen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: SellerDrawer(),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              'assets/backh.png',
              fit: BoxFit.fill,
              width: displayWidth(context),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 180,
                  ),
                  SellerProfileTile(
                    label: 'Shop Name',
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ProfileEditScreen(
                                'Change Name',
                                'New Shop Name',
                                'shop_name',
                              )));
                    },
                  ),
                  SellerProfileTile(
                    label: 'Owner Name',
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ProfileEditScreen(
                              'Change Owner Name',
                              'New Owner Name',
                              'username')));
                    },
                  ),
                  SellerProfileTile(
                    label: 'Mobile Number',
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ProfileEditScreen(
                              'Change Mobile Number',
                              'New Mobile Number',
                              'phone')));
                    },
                  ),
                  SellerProfileTile(
                    label: 'List of Products',
                    onPressed: () async {
                      final user = await FirebaseAuth.instance.currentUser();
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) =>
                              SellerHomeScreen(userUid: user.uid)));
                    },
                  ),
                  SellerProfileTile(
                      label: 'Bank Details',
                      onPressed: () async {
                        final user = await FirebaseAuth.instance.currentUser();
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (context) =>
                                EditBankDetailsScreen(user.uid)));
                      }),
                  SellerProfileTile(
                    label: 'Business Details',
                    onPressed: () async {
                      final user = await FirebaseAuth.instance.currentUser();
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) =>
                              EditBusinessDetailsScreen(user.uid)));
                    },
                  ),
                  SellerProfileTile(
                    label: 'Signature',
                    onPressed: () {},
                  ),
                  SellerProfileTile(
                    label: 'Address',
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => ProfileEditScreen(
                              'Change Address', 'New Address', 'location')));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  _changeName(String hintText, String titleText, String key, String value) {
    if (_textController.text.isEmpty) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Field Cannot Be Empty')));
      return;
    }
    _showChangeDialog(hintText, titleText, _change(key, value));
  }

  _change(String key, String value) async {
    final user = await FirebaseAuth.instance.currentUser();
    await Firestore.instance
        .collection('sellers')
        .document(user.uid)
        .updateData({
      key: value,
    });
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text('Updated Successfully')));
  }

  void _showChangeDialog(
    final String hintText,
    final String titleText,
    final Function onChange,
  ) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(titleText),
                    ),
                    TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8),
                          hintText: hintText,
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 1))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        textColor: Colors.white,
                        color: Colors.green,
                        child: Text('Change'),
                        onPressed: onChange,
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

class SellerProfileTile extends StatelessWidget {
  final String label;
  final Function onPressed;
  SellerProfileTile({
    @required this.label,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                label,
                style: TextStyle(
                    //fontSize: 15,
                    color: Colors.green),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Icon(Icons.arrow_forward_ios, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

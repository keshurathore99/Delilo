import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/authenticate/signin.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class GetLocationPage extends StatefulWidget {
  static const routeName = '/getLocationPage';

  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _addressController = TextEditingController();
  bool _loading = false;
  double myLatitude;
  double myLongitude;

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                    height: 300,
                    child: Image.asset(
                      "assets/images/dellologo.png",
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: 40,
                        width: wid * .8,
                        //color: Colors.white.withOpacity(1),
                        child: Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                'assets/1.png',
                                scale: .1,
                              ),
                            ),
                            FittedBox(
                                child: FlatButton(
                                    padding: EdgeInsets.all(0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    onPressed: () async {
                                      setState(() {
                                        _loading = true;
                                      });

                                      final permission =
                                          await GeolocatorPlatform.instance
                                              .requestPermission();
                                      if (permission ==
                                              LocationPermission.denied ||
                                          permission ==
                                              LocationPermission
                                                  .deniedForever) {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Please Enable Location Permission First')));
                                        return;
                                      }

                                      final myPosition =
                                          await GeolocatorPlatform.instance
                                              .getCurrentPosition();
                                      myLatitude = myPosition.latitude;
                                      myLongitude = myPosition.longitude;

                                      final location = await GeocodingPlatform
                                          .instance
                                          .placemarkFromCoordinates(
                                              myLatitude ?? 0.0,
                                              myLongitude ?? 0.0);

                                      final address = location[0].street +
                                          ', ' +
                                          location[2].name +
                                          ',' +
                                          location[0].subLocality +
                                          ',' +
                                          location[0].locality +
                                          ' ' +
                                          location[0].postalCode;

                                      setState(() {
                                        _loading = false;
                                        _addressController.text = address;
                                      });
                                    },
                                    child: Text(
                                      "Click here to get location automatically",
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic),
                                    ))),
                          ],
                        )),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      width: 200,
                      child: Stack(children: [
                        Divider(
                          thickness: 3,
                          color: Colors.white,
                        ),
                        Center(
                            child: Text(
                          "Or",
                          style: TextStyle(fontSize: 20),
                        )),
                      ])),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  margin: EdgeInsets.symmetric(horizontal: wid / 15),
                  child: TextFormField(
                    controller: _addressController,
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(25)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(width: 0),
                            borderRadius: BorderRadius.circular(25)),
                        hintText: "Type Your Address..."),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 50,
                      width: wid * .8,
                      child: FlatButton(
                          onPressed: () async {
                            final user =
                                await FirebaseAuth.instance.currentUser();

                            if (_addressController.text.isEmpty) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                      Text('Please Fill The Address First')));
                              return;
                            }

                            setState(() {
                              _loading = true;
                            });

                            if (user != null) {
                              await Firestore.instance
                                  .collection('users')
                                  .document(user.uid)
                                  .updateData({
                                'latitude': myLatitude,
                                'longitude': myLongitude,
                                'location': _addressController.text,
                              });
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SigninPage()));
                              setState(() {
                                _loading = false;
                              });
                            } else {
                              setState(() {
                                _loading = false;
                              });
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'There is Some Problem Please Try Again Later')));
                              return;
                            }
                          },
                          child: Text(
                            "Sign up",
                            style: TextStyle(color: Colors.white),
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

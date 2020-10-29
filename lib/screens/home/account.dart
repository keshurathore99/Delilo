import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:image_picker/image_picker.dart';

class AccountInfo extends StatefulWidget {
  final userUid;
  AccountInfo({this.userUid});

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: _appBar(),
      body: FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance
              .collection('users')
              .document(widget.userUid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final snap = snapshot.data.data;
            return Center(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          height: 300,
                          width: width * .9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: FadeInImage(
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.cover,
                                    image: snap['profilePic'] == null
                                        ? AssetImage('assets/ok.png')
                                        : NetworkImage(snap['profilePic']),
                                    placeholder:
                                        AssetImage('assets/ok.png'),
                                  )),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: displayWidth(context) * 0.35),
                                child: ButtonTheme(
                                  height: 20,
                                  minWidth: 30,
                                  child: OutlineButton(
                                      padding: EdgeInsets.all(0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      borderSide:
                                          BorderSide(color: Colors.green),
                                      onPressed: () async {
                                        final pickedFile = await ImagePicker()
                                            .getImage(
                                                source: ImageSource.gallery);
                                        final image = File(pickedFile.path);
                                        final snapshot = await FirebaseStorage
                                            .instance
                                            .ref()
                                            .child('users')
                                            .child(widget.userUid)
                                            .putFile(image)
                                            .onComplete;

                                        final url =
                                            await snapshot.ref.getDownloadURL();

                                        try {
                                          await Firestore.instance
                                              .collection('users')
                                              .document(widget.userUid)
                                              .updateData({
                                            'profilePic': url.toString()
                                          });

                                          _scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      'Updated Successfully')));

                                          setState(() {
                                            snap['profilePic'] = url;
                                          });
                                        } catch (e) {
                                          _scaffoldKey.currentState
                                              .showSnackBar(SnackBar(
                                                  content: Text(e.toString())));
                                          return;
                                        }
                                      },
                                      child: FittedBox(
                                        child: Text(
                                          "Change",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snap['name'],
                                            style:
                                                TextStyle(color: Colors.green),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(snap['phone']),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(snap['email']),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 25),
                                      child: IconButton(
                                        color: Colors.black26,
                                        icon: Icon(Icons.edit),
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Dialog(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'Change Your Details',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        TextField(
                                                            keyboardType:
                                                                TextInputType
                                                                    .phone,
                                                            controller:
                                                                _phoneController,
                                                            decoration: InputDecoration(
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                Colors
                                                                                    .green)),
                                                                contentPadding:
                                                                    EdgeInsets.only(
                                                                        left:
                                                                            8),
                                                                hintText:
                                                                    'New Phone Number',
                                                                border: OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.green)))),
                                                        RaisedButton(
                                                          textColor:
                                                              Colors.white,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          20)),
                                                          color: Colors.green,
                                                          padding:
                                                              EdgeInsets.all(0),
                                                          onPressed: () async {
                                                            if (_phoneController
                                                                .text.isEmpty) {
                                                              _scaffoldKey
                                                                  .currentState
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text('Please Fill Given Fields Correctly')));
                                                              return;
                                                            }

                                                            try {
                                                              await Firestore
                                                                  .instance
                                                                  .collection(
                                                                      'users')
                                                                  .document(widget
                                                                      .userUid)
                                                                  .updateData({
                                                                'phone':
                                                                    _phoneController
                                                                        .text,
                                                              });
                                                              _scaffoldKey
                                                                  .currentState
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text('Name Changed Successfully')));
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                              setState(() {
                                                                snap['phone'] =
                                                                    _phoneController
                                                                        .text;
                                                              });
                                                            } catch (e) {
                                                              _scaffoldKey
                                                                  .currentState
                                                                  .showSnackBar(
                                                                      SnackBar(
                                                                          content:
                                                                              Text(e.toString())));
                                                            }
                                                          },
                                                          child: Text('Save'),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        elevation: 2,
                        margin: EdgeInsets.all(10),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Text(
                        "Address",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => Dialog(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Change Address',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8),
                                            child: TextField(
                                              controller: _addressController,
                                              decoration: InputDecoration(
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .green)),
                                                  contentPadding:
                                                      EdgeInsets.only(left: 8),
                                                  hintText: 'Change Address',
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.green))),
                                            ),
                                          ),
                                          RaisedButton(
                                            color: Colors.green,
                                            textColor: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            onPressed: () async {
                                              if (_addressController
                                                  .text.isNotEmpty) {
                                                try {
                                                  await Firestore.instance
                                                      .collection('users')
                                                      .document(widget.userUid)
                                                      .updateData({
                                                    'location':
                                                        _addressController.text,
                                                  });
                                                  _scaffoldKey.currentState
                                                      .showSnackBar(SnackBar(
                                                          content: Text(
                                                              'Updated Successfully')));
                                                  Navigator.of(context).pop();
                                                  setState(() {
                                                    snap['location'] =
                                                        _addressController.text;
                                                  });
                                                } catch (e) {
                                                  _scaffoldKey.currentState
                                                      .showSnackBar(SnackBar(
                                                    content: Text(e.toString()),
                                                  ));
                                                }
                                              }
                                            },
                                            child: Text('Save'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: Card(
                          semanticContainer: true,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            height: 180,
                            width: width * .9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 38.0),
                                      child: Text(snap['location']),
                                    )
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text(
                                                        'Change Address',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: TextField(
                                                        minLines: 1,
                                                        maxLines: 3,
                                                        keyboardType:
                                                            TextInputType
                                                                .multiline,
                                                        controller:
                                                            _addressController,
                                                        decoration: InputDecoration(
                                                            contentPadding:
                                                                EdgeInsets.only(
                                                                    left: 8),
                                                            hintText:
                                                                'New Address',
                                                            focusedBorder: OutlineInputBorder(
                                                                borderSide: BorderSide(
                                                                    color: Colors
                                                                        .green,
                                                                    width: 1)),
                                                            border:
                                                                OutlineInputBorder()),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(
                                                          horizontal:
                                                              displayWidth(
                                                                      context) *
                                                                  0.25),
                                                      child: RaisedButton(
                                                        textColor: Colors.white,
                                                        color: Colors.green,
                                                        onPressed: () async {
                                                          if (_addressController
                                                              .text.isEmpty) {
                                                            _scaffoldKey
                                                                .currentState
                                                                .showSnackBar(
                                                                    SnackBar(
                                                                        content:
                                                                            Text('Address Cannot Be Empty')));
                                                          }
                                                          await Firestore
                                                              .instance
                                                              .collection(
                                                                  'users')
                                                              .document(widget
                                                                  .userUid)
                                                              .updateData({
                                                            'location':
                                                                _addressController
                                                                    .text
                                                          });
                                                          Navigator.of(context)
                                                              .pop();
                                                          _scaffoldKey
                                                              .currentState
                                                              .showSnackBar(SnackBar(
                                                                  content: Text(
                                                                      'Updated Successfully')));
                                                          setState(() {
                                                            snap['location'] =
                                                                _addressController
                                                                    .text;
                                                          });
                                                        },
                                                        child: FittedBox(
                                                            child:
                                                                Text('Save')),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.black26,
                                  ),
                                )
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 2,
                          margin: EdgeInsets.all(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.green[700],
      title: Text(
        "My Account",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      centerTitle: true,
      actions: [
        Icon(
          Icons.notifications,
          color: Colors.white,
        )
      ],
    );
  }
}

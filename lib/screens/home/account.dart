import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class AccountInfo extends StatefulWidget {
  final userUid;
  AccountInfo({this.userUid});

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Scaffold(
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
                          //color: Colors.redAccent.withOpacity(.6),
                          //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset("assets/u.png")),
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
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/homescreen');
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snap['name'],
                                      style: TextStyle(color: Colors.green),
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
                      child: Card(
                        semanticContainer: true,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Container(
                          height: 180,
                          width: width * .9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 38.0),
                                child: Text(snap['location']),
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

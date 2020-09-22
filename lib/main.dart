import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/home/homepage.dart';
import 'package:delilo/screens/seller/home/sellerhomesceen.dart';
import 'package:delilo/screens/wrapper.dart';
import 'package:delilo/services/navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigationHelper.onGenerateroutes,
      home: StreamBuilder<FirebaseUser>(
          stream: FirebaseAuth.instance.onAuthStateChanged,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  title: Text('Please Wait'),
                ),
                backgroundColor: Colors.white,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            if (snapshot.data == null || snapshot.data.uid == null) {
              return Wrapper();
            }

            return FutureBuilder<DocumentSnapshot>(
              future: Firestore.instance
                  .collection('sellers')
                  .document(snapshot.data.uid)
                  .get(),
              builder: (context, smallShot) {
                if (smallShot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.green,
                      title: Text('Please Wait'),
                    ),
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                if (smallShot.data.data == null) {
                  return FutureBuilder<DocumentSnapshot>(
                    future: Firestore.instance
                        .collection('users')
                        .document(snapshot.data.uid)
                        .get(),
                    builder: (context, smallerShot) {
                      if (smallerShot.connectionState ==
                          ConnectionState.waiting) {
                        return Scaffold(
                          backgroundColor: Colors.white,
                          appBar: AppBar(
                            backgroundColor: Colors.green,
                            title: Text('Please Wait'),
                          ),
                          body: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return HomePageScreen(userUid: snapshot.data.uid);
                    },
                  );
                }
                return SellerHomeScreen(
                  userUid: snapshot.data.uid,
                );
              },
            );
          }),
    );
  }
}

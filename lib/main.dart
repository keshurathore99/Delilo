import 'package:delilo/screens/authenticate/getlocation.dart';
import 'package:delilo/screens/authenticate/signin.dart';
import 'package:delilo/screens/home/homepage.dart';
import 'package:delilo/screens/seller/authenticate/selleregister.dart';
import 'package:delilo/screens/seller/home/newproductpage.dart';
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null || snapshot.data.uid == null) {
              return Wrapper();
            }

            return HomePageScreen();
          }),
    );
  }
}

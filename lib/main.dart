import 'package:delilo/screens/authenticate/authenticate.dart';
import 'package:delilo/screens/home/homepage.dart';
import 'package:delilo/screens/wrapper.dart';
import 'package:delilo/services/navigation.dart';
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
      home: HomePageScreen(),
    );
  }
}

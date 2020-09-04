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
      home: Wrapper(),
    );
  }
}

import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:flutter/material.dart';

class LoadingBarForMainTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: displayHeight(context) / 2,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

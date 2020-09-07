import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  final String title;
  final String path;
  CategoryRow(this.title, this.path);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.green),
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              height: 30,
              width: displayWidth(context) * .2,
              child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, path);
                  },
                  child: Text("More"))),
        ],
      ),
    );
  }
}

import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/home/fashion/womenfashiondress.dart';
import 'package:flutter/material.dart';

class CategoryRow extends StatelessWidget {
  final String title;
  final String category;
  final String clothType;

  CategoryRow(this.title, this.category, this.clothType);

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
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WomenDressDetailPage(
                              category: category,
                              clothType: clothType,
                            )));
                  },
                  child: Text("More"))),
        ],
      ),
    );
  }
}

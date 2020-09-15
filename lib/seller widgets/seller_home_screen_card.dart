import 'package:delilo/screens/seller/home/sellercatgorylisting.dart';
import 'package:flutter/material.dart';

class SellerHomeScreenCard extends StatelessWidget {
  final String title;
  final int items;
  SellerHomeScreenCard(this.title, this.items);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => SellerCategoryListing()));
      },
      child: Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(items.toString() + ' Items'),
                ],
              ),
            ),
            Align(alignment: Alignment(1, -.8), child: Text("EDIT")),
          ],
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 2,
        margin: EdgeInsets.all(5),
      ),
    );
  }
}

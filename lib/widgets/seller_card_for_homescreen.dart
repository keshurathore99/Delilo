import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:flutter/material.dart';

class SellerCardForHomeScreen extends StatelessWidget {
  final String shopName;
  final String shopCategory;
  final double distance;
  final double stars;
  final String imageUrl;

  SellerCardForHomeScreen(
      {@required this.shopName,
      @required this.shopCategory,
      @required this.distance,
      @required this.stars,
      @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final width = displayWidth(context);

    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: width * .9,
        height: width * .27,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            FadeInImage(
              placeholder: AssetImage(
                  'assets/dairy/photo-1497800640957-3100979af57c.jpeg'),
              image: NetworkImage(imageUrl),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 8, bottom: 4),
                              child: Text(
                                shopName,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                shopCategory,
                                style: TextStyle(color: Colors.green),
                              ),
                            ),
                          ],
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              stars.toString(),
                              style: TextStyle(color: Colors.green),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(distance.toStringAsFixed(1) +
                        ' Km away from your location'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    );
  }
}

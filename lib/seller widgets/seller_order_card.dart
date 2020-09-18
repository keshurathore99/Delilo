import 'package:flutter/material.dart';

class SellerOrdersCard extends StatefulWidget {
  final Map<String, dynamic> orderData;
  final String nextButtonTitle;
  final Function onNextButtonPressed;
  SellerOrdersCard({
    @required this.orderData,
    @required this.nextButtonTitle,
    @required this.onNextButtonPressed,
  });

  @override
  _SellerOrdersCardState createState() => _SellerOrdersCardState();
}

class _SellerOrdersCardState extends State<SellerOrdersCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.orderData['orderId'].toString()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'New Order',
                  style: TextStyle(color: Colors.green),
                ),
                Text(widget.orderData['name']),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.orderData['productName'],
                style: TextStyle(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      "Total Bill : ₹ ${widget.orderData['price'].toString()}",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.green),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      'Not Paid',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(widget.orderData['address'])
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  child: Text(widget.orderData['mobile']),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green[700],
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  height: 35,
                  child: FlatButton(
                      onPressed: () {},
                      child: Text(
                        widget.nextButtonTitle,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))),
            ),
          ],
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(6),
    );
  }
}

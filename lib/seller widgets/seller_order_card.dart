import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SellerOrdersCard extends StatefulWidget {
  final Map<String, dynamic> orderData;
  final String nextButtonTitle;
  final String pastListName;
  final String newListName;
  final bool isDeliveredPage;
  SellerOrdersCard({
    @required this.orderData,
    @required this.nextButtonTitle,
    @required this.pastListName,
    @required this.newListName,
    this.isDeliveredPage: false,
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
                  widget.orderData['status'],
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
                      widget.orderData['type'],
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
            widget.isDeliveredPage
                ? Container()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green[700],
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 35,
                        child: FlatButton(
                            onPressed: moveToOther,
                            child: Text(
                              widget.nextButtonTitle,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
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

  Future<void> moveToOther() async {
    if (widget.newListName == null && widget.pastListName == null) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('You Cannot Move Your Product From Here'),
      ));
      return;
    }

    final user = await FirebaseAuth.instance.currentUser();
    final orderRef = Firestore.instance
        .collection('sellers')
        .document(user.uid)
        .collection('orders')
        .document(widget.orderData['userUid']);

    final userRef = Firestore.instance
        .collection('users')
        .document(widget.orderData['userUid']);

    final orderSnapshot = await orderRef.get();

    final pastOrderList = orderSnapshot.data[widget.pastListName] as List;
    final newOrderList = orderSnapshot.data[widget.newListName] as List;

    widget.orderData['status'] = widget.newListName;
    newOrderList.add(widget.orderData);
    pastOrderList.removeWhere(
        (e) => e['uniqueProductId'] == widget.orderData['uniqueProductId']);

    try {
      await orderRef.updateData({widget.pastListName: pastOrderList});
      await orderRef.updateData({widget.newListName: newOrderList});

      final userSnapshot = await userRef.get();

      final notificationList = userSnapshot.data['notifications'] as List;

      if (notificationList != null) {
        notificationList.add({
          'message':
              'Your Order For ${widget.orderData['productName']} is ${widget.orderData['status']}',
          'dateTime': DateTime.now(),
          'productImage': widget.orderData['productImage'],
        });

        await userRef.updateData({'notifications': notificationList});
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(
          SnackBar(content: Text('There is Some Problem' + e.toString())));
    }
  }
}

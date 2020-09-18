import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/seller%20widgets/seller_order_card.dart';
import 'package:flutter/material.dart';

class AllOrderScreen extends StatelessWidget {
  final String sellerUid;
  AllOrderScreen(this.sellerUid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('sellers')
            .document(sellerUid)
            .collection('orders')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot == null ||
              snapshot.data == null ||
              snapshot.data.documents.length == 0) {
            return Center(
              child: Text(
                'No Orders For Now',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
            );
          }

          final realList = [];

          snapshot.data.documents.forEach((smallShot) {
            final newOrderList = smallShot.data['newOrders'] as List;
            final packingOrderList = smallShot.data['packing'] as List;
            final readyOrderList = smallShot.data['ready'] as List;
            final pickedOrderList = smallShot.data['picked'] as List;
            final shippingOrderList = smallShot.data['shipping'] as List;
            final deliveredOrderList = smallShot.data['delivered'] as List;
            newOrderList.forEach((element) {
              realList.add(element);
            });
            packingOrderList.forEach((element) {
              realList.add(element);
            });
            readyOrderList.forEach((element) {
              realList.add(element);
            });
            pickedOrderList.forEach((element) {
              realList.add(element);
            });
            shippingOrderList.forEach((element) {
              realList.add(element);
            });
            deliveredOrderList.forEach((element) {
              realList.add(element);
            });
          });

          if (realList.length == 0) {
            return Center(
              child: Text('No Order Till Now'),
            );
          }

          return ListView(
            children: realList
                .map((e) => SellerOrdersCard(
                      orderData: e,
                      nextButtonTitle: e['status'],
                      pastListName: null,
                      newListName: null,
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

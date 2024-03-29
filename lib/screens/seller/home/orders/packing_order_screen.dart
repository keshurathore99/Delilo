import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/seller%20widgets/seller_order_card.dart';
import 'package:flutter/material.dart';

class PackingOrderScreen extends StatelessWidget {
  final String sellerUid;
  PackingOrderScreen(this.sellerUid);

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
            final newOrderList = smallShot.data['packing'] as List;
            newOrderList.forEach((element) {
              realList.add(element);
            });
          });

          if (realList.length == 0) {
            return Center(
              child: Text(
                'No Order In Packing',
                style: TextStyle(color: Colors.green),
              ),
            );
          }

          return ListView(
            children: realList
                .map((e) => SellerOrdersCard(
                      orderData: e,
                      nextButtonTitle: 'Move To Ready',
                      pastListName: 'packing',
                      newListName: 'ready',
                    ))
                .toList(),
          );
        },
      ),
    );
  }
}

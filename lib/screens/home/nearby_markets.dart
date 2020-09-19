import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class NearbyMarkets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nearby Markets'),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection('nearbyMarkets').getDocuments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot == null || snapshot.data == null) {
            return Center(
              child: Text('There Is No Nearby Market'),
            );
          }
          return Container();
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PayinPage extends StatefulWidget {
  final String sellerUid;
  PayinPage({@required this.sellerUid});

  @override
  _PayinPageState createState() => _PayinPageState();
}

class _PayinPageState extends State<PayinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SellerDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset('assets/u.png'),
          );
        }),
        title: Text(
          "Payin",
          style: TextStyle(color: Colors.green),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance
              .collection('sellers')
              .document(widget.sellerUid)
              .collection('orders')
              .getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot == null || snapshot.data == null) {
              return Center(
                child: Text('No Payin Yet'),
              );
            }

            final realList = [];

            snapshot.data.documents.forEach((element) {
              final deliveredList = element.data['delivered'] as List;
              deliveredList.forEach((insideSnapshot) {
                realList.add(insideSnapshot);
              });
            });

            if (realList.length == 0) {
              return Center(
                child: Text('No Payin Yet'),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView(
                    children: realList.map((product) {
                      return Card(
                        child: ListTile(
                          leading: Image.network(product['productImage']),
                          title: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Product Name : ' + product['productName'],
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  '₹ ' + product['price'].toString(),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  DateFormat.MMMMEEEEd().add_jm().format(
                                      (product['dateTime'] as Timestamp)
                                          .toDate()),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }),
    );
  }
}

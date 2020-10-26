import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/buyer%20widgets/drawer.dart';
import 'package:delilo/screens/home/order_tracking_screen.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class OrdersPage extends StatefulWidget {
  final String userUid;
  OrdersPage({@required this.userUid});

  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  final realList = [];

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: FutureBuilder<DocumentSnapshot>(
          future: Firestore.instance
              .collection('users')
              .document(widget.userUid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final newOrderList = snapshot.data.data['newOrders'] as List;
            final pastOrderList = snapshot.data.data['pastOrders'] as List;

            if (newOrderList == null || pastOrderList == null) {
              return Center(
                child: Text('Please Order Something and Then Come Again'),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: newOrderList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            index == 0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    child: Text(
                                      'New Orders',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  )
                                : Container(),
                            FutureBuilder<DocumentSnapshot>(
                              future: Firestore.instance
                                  .document(newOrderList[index])
                                  .get(),
                              builder: (context, newOrderSnapshot) {
                                if (newOrderSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                }

                                final data = newOrderSnapshot.data.data;

                                final newOrderList = data['newOrders'] as List;
                                if (newOrderList.length > index) {
                                  realList.add(newOrderList[index]);
                                  print('new Order');
                                }

                                final packingProductList =
                                    data['packing'] as List;
                                if (packingProductList.length > index) {
                                  realList.add(packingProductList[index]);
                                  print('packing Product');
                                }

                                final readyProductList = data['ready'] as List;
                                if (readyProductList.length > index) {
                                  realList.add(readyProductList[index]);
                                  print('ready Product');
                                }

                                final pickedProductList =
                                    data['picked'] as List;
                                if (pickedProductList.length > index) {
                                  realList.add(pickedProductList[index]);
                                  print('Picked Product');
                                }

                                final shippingProductList =
                                    data['shipping'] as List;
                                if (shippingProductList.length > index) {
                                  realList.add(shippingProductList[index]);
                                  print('shipping Product');
                                }

                                return ArrivingSoonTile(
                                  orderData: realList[index],
                                );
                              },
                            ),
                          ],
                        );
                      }),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: pastOrderList.length,
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            index == 0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 8),
                                    child: Text(
                                      'Past Orders',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  )
                                : Container(),
                            FutureBuilder<DocumentSnapshot>(
                              future: Firestore.instance
                                  .document(pastOrderList[index])
                                  .get(),
                              builder: (context, pastOrderSnapshot) {
                                if (pastOrderSnapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Container();
                                }
                                final pastOrderList =
                                    pastOrderSnapshot.data.data['delivered'];
                                return PastOrderTile(
                                  orderData: pastOrderList[index],
                                );
                              },
                            ),
                          ],
                        );
                      }),
                ),
              ],
            );
          }),
    );
  }
}

class ArrivingSoonTile extends StatelessWidget {
  final Map<String, dynamic> orderData;
  ArrivingSoonTile({@required this.orderData});

  @override
  Widget build(BuildContext context) {
    final width = displayWidth(context);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: width * .9,
        height: width * .25,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                width: width * .17,
                height: width * .19,
                image: NetworkImage(orderData['productImage']),
                placeholder: AssetImage('assets/fashion/fashion7.jpg'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    orderData['productName'],
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .03),
                  ),
                  Text(
                    orderData['type'],
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .03),
                  ),
                  Text(
                    '₹ ' + orderData['price'].toString(),
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: width * .03,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () {},
                        child: Text(
                          "Cancel",
                        )),
                    Container(
                        height: width * .07,
                        width: width * .25,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => OrderTrackingScreen(
                                      orderData: orderData,
                                    )));
                          },
                          child: Text(
                            "Track",
                            style: TextStyle(
                                color: Colors.white, fontSize: width * .032),
                          ),
                          color: Colors.green,
                        )),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      orderData['otp'].toString(),
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}

class PastOrderTile extends StatelessWidget {
  final Map<String, dynamic> orderData;
  PastOrderTile({@required this.orderData});

  @override
  Widget build(BuildContext context) {
    final width = displayWidth(context);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: width * .9,
        height: width * .25,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              FadeInImage(
                fit: BoxFit.cover,
                width: width * .17,
                height: width * .19,
                image: NetworkImage(orderData['productImage']),
                placeholder: AssetImage('assets/fashion/fashion7.jpg'),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    orderData['productName'],
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .03),
                  ),
                  Text(
                    orderData['type'],
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .03),
                  ),
                  Text(
                    '₹ ' + orderData['price'].toString(),
                    style:
                        TextStyle(color: Colors.green, fontSize: width * .05),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}

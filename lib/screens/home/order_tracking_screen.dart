import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:flutter/material.dart';

class OrderTrackingScreen extends StatefulWidget {
  final Map<String, dynamic> orderData;
  OrderTrackingScreen({@required this.orderData});

  @override
  _OrderTrackingScreenState createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  Color newOrderColor,
      packingColor,
      readyColor,
      pickedColor,
      shippedColor,
      deliveredColor,
      container1,
      container2,
      container3,
      container4,
      container5;

  @override
  Widget build(BuildContext context) {
    getColors();

    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Tracking The Order',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Amount : ₹ ' + widget.orderData['price'].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Status : ' + widget.orderData['status'],
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 80),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            CircleAvatar(
                              backgroundColor: newOrderColor,
                              radius: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                                color: container1,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: packingColor,
                              radius: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                                color: container2,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: readyColor,
                              radius: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                                color: container3,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: pickedColor,
                              radius: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                                color: container4,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: shippedColor,
                              radius: 10,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                                color: container5,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: deliveredColor,
                              radius: 10,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Your Order Has Been Placed'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                              ),
                            ),
                            Text('Your Order is Packing'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                              ),
                            ),
                            Text('Your Order is Ready'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                              ),
                            ),
                            Text('Your Order is Picked'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                              ),
                            ),
                            Text('Your Order is Shipped'),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: displayWidth(context) * 0.24),
                              child: Container(
                                height: 30,
                              ),
                            ),
                            Text('Your Order is Delivered'),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }

  void getColors() {
    switch (widget.orderData['status']) {
      case 'New Orders':
        newOrderColor = Colors.green;
        packingColor = Colors.black45;
        readyColor = Colors.black45;
        pickedColor = Colors.black45;
        shippedColor = Colors.black45;
        deliveredColor = Colors.black45;
        container1 = Colors.black45;
        container2 = Colors.black45;
        container3 = Colors.black45;
        container4 = Colors.black45;
        container5 = Colors.black45;
        break;

      case 'packing':
        newOrderColor = Colors.green;
        packingColor = Colors.green;
        readyColor = Colors.black45;
        pickedColor = Colors.black45;
        shippedColor = Colors.black45;
        deliveredColor = Colors.black45;
        container1 = Colors.green;
        container2 = Colors.black45;
        container3 = Colors.black45;
        container4 = Colors.black45;
        container5 = Colors.black45;
        break;

      case 'ready':
        newOrderColor = Colors.green;
        packingColor = Colors.green;
        readyColor = Colors.green;
        pickedColor = Colors.black45;
        shippedColor = Colors.black45;
        deliveredColor = Colors.black45;
        container1 = Colors.green;
        container2 = Colors.green;
        container3 = Colors.black45;
        container4 = Colors.black45;
        container5 = Colors.black45;
        break;

      case 'picked':
        newOrderColor = Colors.green;
        packingColor = Colors.green;
        readyColor = Colors.green;
        pickedColor = Colors.green;
        shippedColor = Colors.black45;
        deliveredColor = Colors.black45;
        container1 = Colors.green;
        container2 = Colors.green;
        container3 = Colors.green;
        container4 = Colors.black45;
        container5 = Colors.black45;
        break;

      case 'shipping':
        newOrderColor = Colors.green;
        packingColor = Colors.green;
        readyColor = Colors.green;
        pickedColor = Colors.green;
        shippedColor = Colors.green;
        deliveredColor = Colors.black45;
        container1 = Colors.green;
        container2 = Colors.green;
        container3 = Colors.green;
        container4 = Colors.green;
        container5 = Colors.black45;
        break;

      case 'delivered':
        newOrderColor = Colors.green;
        packingColor = Colors.green;
        readyColor = Colors.green;
        pickedColor = Colors.green;
        shippedColor = Colors.green;
        deliveredColor = Colors.green;
        container1 = Colors.green;
        container2 = Colors.green;
        container3 = Colors.green;
        container4 = Colors.green;
        container5 = Colors.green;
        break;
    }
  }
}

enum OrderStatus {
  newOrder,
  packing,
  ready,
  picked,
  shipping,
  delivered,
}

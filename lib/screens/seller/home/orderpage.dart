import 'package:delilo/screens/seller/home/orders/all_order_screen.dart';
import 'package:delilo/screens/seller/home/orders/delivered_order_screen.dart';
import 'package:delilo/screens/seller/home/orders/new_order_screen.dart';
import 'package:delilo/screens/seller/home/orders/packing_order_screen.dart';
import 'package:delilo/screens/seller/home/orders/picked_order_screen.dart';
import 'package:delilo/screens/seller/home/orders/ready_order_screen.dart';
import 'package:delilo/screens/seller/home/orders/shipping_order_screen.dart';
import 'package:flutter/material.dart';

class SellerOrdersPage extends StatefulWidget {
  final sellerUid;
  SellerOrdersPage({@required this.sellerUid});

  @override
  _SellerOrdersPageState createState() => _SellerOrdersPageState();
}

class _SellerOrdersPageState extends State<SellerOrdersPage> {
  int isselected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Builder(builder: (BuildContext context) {
        switch (isselected) {
          case 1:
            return AllOrderScreen(widget.sellerUid);
          case 2:
            return NewOrderScreen(widget.sellerUid);
          case 3:
            return PackingOrderScreen(widget.sellerUid);
          case 4:
            return ReadyOrderScreen(widget.sellerUid);
          case 5:
            return PickedOrderScreen(widget.sellerUid);
          case 6:
            return ShippingOrderScreen(widget.sellerUid);
          case 7:
            return DeliveredOrderScreen(widget.sellerUid);
        }
        return Center(
          child: ListView(children: []),
        );
      }),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Builder(builder: (context) {
        return InkWell(
          onTap: () {
            Scaffold.of(context).openDrawer();
          },
          child: Image.asset('assets/u.png'),
        );
      }),
      title: Text(
        "Accepting Orders",
        style: TextStyle(color: Colors.green),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  isselected = 1;
                });
              },
              child: Container(
                child: Center(child: Text("All")),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1.2,
                          color: (isselected == 1)
                              ? Colors.green
                              : Colors.transparent)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected = 2;
                });
              },
              child: Container(
                child: Center(child: Text("New")),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1.2,
                          color: (isselected == 2)
                              ? Colors.green
                              : Colors.transparent)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected = 3;
                });
              },
              child: Container(
                child: Center(child: Text("Packing")),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1.2,
                          color: (isselected == 3)
                              ? Colors.green
                              : Colors.transparent)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected = 4;
                });
              },
              child: Container(
                child: Center(child: Text("Ready")),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1.2,
                          color: (isselected == 4)
                              ? Colors.green
                              : Colors.transparent)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected = 5;
                });
              },
              child: Container(
                child: Center(child: Text("Picked")),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1.2,
                          color: (isselected == 5)
                              ? Colors.green
                              : Colors.transparent)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected = 6;
                });
              },
              child: Container(
                child: Center(child: Text("Shipping")),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1.2,
                          color: (isselected == 6)
                              ? Colors.green
                              : Colors.transparent)),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  isselected = 7;
                });
              },
              child: Container(
                child: Center(child: Text("Delivered")),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 1.2,
                          color: (isselected == 7)
                              ? Colors.green
                              : Colors.transparent)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
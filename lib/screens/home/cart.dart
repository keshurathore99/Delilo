import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/home/paymentpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class CartPage extends StatefulWidget {
  final userUid;
  CartPage({this.userUid});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection('users')
              .document(widget.userUid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final cartProducts = snapshot.data.data['cartProducts'] as List;

            if (cartProducts.length == 0) {
              return Center(
                child: Text('Cart is Empty'),
              );
            }

            return Center(
              child: Container(),
            );
          }),
      bottomSheet: _bottomSheetBuyNow(),
    );
  }

  Widget _bottomSheetBuyNow() {
    final width = displayWidth(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: width * .95,
        height: width * .3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Divider(
              color: Colors.brown,
              thickness: 2,
            ),
            Container(
              width: width * .8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Your Order"),
                  Text('0'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaymentPage()));
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Material(
                  child: Center(
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          height: 50,
                          width: width * .8,
                          child: FlatButton(
                            child: Text(
                              "Buy Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            onPressed: () {},
                          ))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      leading: GestureDetector(
        child: Icon(
          Icons.arrow_back_ios,
          color: Colors.green,
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      title: Text(
        "My Cart",
        style: TextStyle(color: Colors.black, fontSize: 25),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

class ProductCard extends StatefulWidget {
  final String name;
  final int price;
  int productid;
  final String imageurl;

  //final String category;
  ProductCard({this.price, this.productid, this.name, this.imageurl});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: width * .7,
        height: width * .25,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: width * .4,
                width: width * .34,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/3.png',
                    height: width * .23,
                    width: width * .28,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //direction: Axis.vertical,

                children: [
                  Text(
                    widget.name.toUpperCase(),
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
                  Text(
                    "Shop Name",
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.productid = widget.productid - 1;
                              });
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              radius: 13,
                              backgroundColor: Colors.grey[300],
                            )),
                      ),
                      Text(widget.productid.toString()),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.productid = widget.productid + 1;
                              });
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              radius: 13,
                              backgroundColor: Colors.grey[300],
                            )),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Align(
                  alignment: Alignment(-1, -.8),
                  child: Text(
                    "Price: Rs ${widget.price.toString()}",
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
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

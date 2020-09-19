import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/screens/home/paymentpage.dart';
import 'package:delilo/screens/home/productdetailspage.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class CartPage extends StatefulWidget {
  final userUid;
  CartPage({this.userUid});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Product> _list = [];
  int totalPrice = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<DocumentSnapshot>(
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

                  final cartProducts =
                      snapshot.data.data['cartProducts'] as List;

                  if (cartProducts.length == 0) {
                    return Center(
                      child: Text('Cart is Empty'),
                    );
                  }

                  return ListView.builder(
                      itemCount: cartProducts.length,
                      itemBuilder: (context, index) {
                        return FutureBuilder<DocumentSnapshot>(
                            future: Firestore.instance
                                .document(cartProducts[index])
                                .get(),
                            builder: (context, smallShot) {
                              if (smallShot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                  child: Container(),
                                );
                              }
                              final snap = smallShot.data.data;
                              final product = Product(
                                  sellerId: snap['sellerId'],
                                  imageUrl: snap['image1'],
                                  productName: snap['name'],
                                  shopName: snap['shop_name'],
                                  price: int.parse(snap['price']),
                                  ratings: 4.3,
                                  colors: [Colors.black26],
                                  description: snap['description'],
                                  reviews: [],
                                  image2: snap['image2'],
                                  image3: snap['image3'],
                                  image4: snap['image4'],
                                  productType: snap['productType'],
                                  productId: snap['productId'],
                                  inStock: snap['inStock']);
                              _list.add(product);
//                              totalPrice = totalPrice + product.price;
                              return ProductCard(product);
                            });
                      });
                }),
          ),
          _bottomSheetBuyNow(),
        ],
      ),
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
              thickness: 1,
            ),
            Container(
              width: width * .8,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Your Order"),
                  Text(
                    '₹ $totalPrice',
                    style: TextStyle(color: Colors.green),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PaymentPage(
                          priceToPay: '2233',
                        )));
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
                          height: 40,
                          width: width * .8,
                          child: FlatButton(
                            child: Text(
                              "Buy Now",
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              if (_list.length == 0) {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Your Cart is Empty')));
                                return;
                              }
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                      priceToPay: '2233', productList: _list)));
                            },
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
  final Product product;
  ProductCard(this.product);

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: widget.product)));
      },
      child: Card(
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
                  width: width * .34,
                  child: Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: EdgeInsets.only(right: 10),
                      child: FadeInImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.product.imageUrl),
                        placeholder: AssetImage('assets/fashion/fashion7.jpg'),
                      )),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.product.productName,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: width * .04,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.product.shopName,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: width * .04,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (quantity < 2) {
                                return;
                              }
                              setState(() {
                                quantity--;
                              });
                            },
                          ),
                          Text(quantity.toString()),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12.0),
                  child: Align(
                    alignment: Alignment(-1, -.8),
                    child: Text(
                      "₹ ${(widget.product.price * quantity).toString()}",
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: width * .04,
                          fontWeight: FontWeight.bold),
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
        margin: EdgeInsets.all(5),
      ),
    );
  }
}

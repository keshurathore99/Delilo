import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/screens/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'dart:math' as math;

import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentPage extends StatefulWidget {
  final String priceToPay;
  final List<Product> productList;
  PaymentPage({@required this.priceToPay, this.productList});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

enum PaymentMode { cod, prepaid }

class _PaymentPageState extends State<PaymentPage> {
  PaymentMode selected = PaymentMode.cod;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Text(
              'Select Your Payment Method',
              style: TextStyle(color: Colors.green),
            ),
          ),
          Card(
            semanticContainer: true,
            child: Container(
              height: 80,
              // color: Colors.redAccent.withOpacity(.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/10 (2).png'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Prepaid",
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                  Radio(
                    activeColor: Colors.green,
                    value: PaymentMode.prepaid,
                    onChanged: (value) {
                      setState(() {
                        selected = value;
                      });
                    },
                    groupValue: selected,
                  )
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
          Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Container(
              height: 80,
              // color: Colors.redAccent.withOpacity(.6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Image.asset('assets/10 (1).png'),
                  Expanded(
                    child: Text(
                      "Cash On Delivery",
                      style:
                          TextStyle(fontSize: 20, fontStyle: FontStyle.italic),
                    ),
                  ),
                  Radio(
                    activeColor: Colors.green,
                    value: PaymentMode.cod,
                    groupValue: selected,
                    onChanged: (PaymentMode value) {
                      setState(() {
                        selected = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.green[700],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Pay :  ₹${widget.priceToPay}",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                child: FlatButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddressPage(
                                  paymentMode: selected,
                                  priceToPay: widget.priceToPay,
                                  productList: widget.productList)));
                    },
                    child: Text(
                      "Pay Now",
                      style: TextStyle(color: Colors.green, fontSize: 17),
                    ))),
          ],
        ),
      ),
    );
  }
}

class AddressPage extends StatefulWidget {
  final String priceToPay;
  final List<Product> productList;
  final PaymentMode paymentMode;
  AddressPage({@required this.priceToPay, this.productList, this.paymentMode});

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _nameController = TextEditingController(),
      _addressContoller = TextEditingController(),
      _pinController = TextEditingController(),
      _nearbyLandmark = TextEditingController(),
      _mobileContoller = TextEditingController(),
      _altMobileController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;
  static List<Product> _mainList;
  Razorpay _razorPay;

  @override
  void initState() {
    super.initState();
    _mainList = widget.productList;
    _razorPay = Razorpay();
    _razorPay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorPay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorPay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.green[700],
          title: Text(
            PaymentMode.cod == widget.paymentMode
                ? "Cash On Delivery"
                : 'Prepaid',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        body: Center(
          child: Container(
            width: wid * .8,
            child: ListView(
              children: [
                _textField(_nameController, TextInputType.name, 'Full Name'),
                _textField(
                    _addressContoller, TextInputType.multiline, 'Full Address',
                    isAddress: true),
                _textField(_pinController, TextInputType.number, 'Pincode'),
                _textField(
                    _nearbyLandmark, TextInputType.text, 'Nearby Landmark'),
                _textField(
                    _mobileContoller, TextInputType.phone, 'Mobile Number'),
                _textField(_altMobileController, TextInputType.phone,
                    'Alter Mobile Number'),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 18),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      height: 40,
                      width: wid * .8,
                      child: FlatButton(
                          onPressed: () async {
                            if (_nameController.text.isEmpty ||
                                _addressContoller.text.isEmpty ||
                                _pinController.text.isEmpty ||
                                _addressContoller.text.isEmpty ||
                                _mobileContoller.text.isEmpty ||
                                _altMobileController.text.isEmpty) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                      Text('Please Fill All Fields First')));
                              return;
                            }
                            if (_mobileContoller.text.length != 10 ||
                                _altMobileController.text.length != 10) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'Please Enter a Valid Mobile Number')));
                              return;
                            }

                            if (_mobileContoller.text ==
                                _altMobileController.text) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'Both Mobile Numbers Cannot Be Same')));
                              return;
                            }

                            if (widget.paymentMode == PaymentMode.prepaid) {
                              openCheckout();
                              return;
                            }

                            if (widget.paymentMode == PaymentMode.cod) {
                              _putOrder('Cash on Delivery');
                            }
                          },
                          child: Text(
                            'Save',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openCheckout() async {
    final user = await FirebaseAuth.instance.currentUser();
    final userSnapshot =
        await Firestore.instance.collection('users').document(user.uid).get();

    var options = {
      'key': 'rzp_test_0h7w37aoojQqRw',
      'amount': 2000, //double.parse(widget.priceToPay).round(),
      'name': 'CWS',
      'description': 'Buy',
      'prefill': {
        'contact': _mobileContoller.text,
        'email': userSnapshot.data['email']
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorPay.open(options);
    } catch (e) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.toString())));
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) async {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("SUCCESS: " + response.paymentId)));
    await Future.delayed(Duration(seconds: 5));
    _putOrder('Paid');
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(
            "ERROR: " + response.code.toString() + " - " + response.message)));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text("EXTERNAL_WALLET: " + response.walletName)));
  }

  Widget _textField(
      TextEditingController controller, final keyboardType, final hintText,
      {bool isAddress: false}) {
    return Container(
      margin: EdgeInsets.all(12),
      height: isAddress == false ? 5 * 10.0 : null,
      width: displayWidth(context) * .8,
      child: Material(
        child: TextFormField(
          minLines: isAddress == true ? 3 : 1,
          maxLines: isAddress == true ? 3 : 1,
          keyboardType: keyboardType,
          controller: controller,
          decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8)),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.transparent),
                  borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 0, color: Colors.green),
                  borderRadius: BorderRadius.circular(8)),
              hintText: hintText),
        ),
      ),
    );
  }

  Future<void> _putOrder(String paymentType) async {
    try {
      setState(() {
        _loading = true;
      });

      final user = await FirebaseAuth.instance.currentUser();

      final orderId = _generateOrderId();

      final userRef = Firestore.instance.collection('users').document(user.uid);

      final listLength = _mainList.length;

      final userShot = await userRef.get();

      for (int i = 0; i < listLength; i++) {
        Product product = _mainList[i];
        final otp = int.parse(
            DateTime.now().millisecondsSinceEpoch.toString().substring(0, 4));

        final cartProductList = userShot.data['cartProducts'] as List;

        final cartProduct = cartProductList.firstWhere((element) =>
            element['productId'].toString().contains(product.productId));

        int randomNumber = math.Random().nextInt(999999999);

        while (randomNumber.toString().length != 9) {
          randomNumber = math.Random().nextInt(999999999);
        }

        final orderData = {
          'name': _nameController.text,
          'address': _addressContoller.text,
          'pincode': _pinController.text,
          'nearByLandMark': _nameController.text,
          'mobile': _mobileContoller.text,
          'alterMobile': _altMobileController.text,
          'dateTime': DateTime.now(),
          'price': product.price,
          'type': paymentType,
          'orderId': orderId,
          'productName': product.productName,
          'productType': product.productType,
          'productId': product.productId,
          'productImage': product.imageUrl,
          'sellerId': product.sellerId,
          'otp': otp,
          'userUid': user.uid,
          'uniqueProductId': randomNumber,
          'status': 'New Orders',
          'quantity': cartProduct['quantity'],
          'totalPrice': cartProduct['price'],
        };

        final ordersRef = Firestore.instance
            .collection('sellers')
            .document(product.sellerId)
            .collection('orders')
            .document(user.uid);

        final sellerOrdersSnapshot = await ordersRef.get();

        if (!sellerOrdersSnapshot.exists) {
          await ordersRef.setData({
            'newOrders': [orderData],
            'packing': [],
            'ready': [],
            'picked': [],
            'shipping': [],
            'delivered': [],
          });

          final userSnapshot = await userRef.get();

          if (userSnapshot.data['newOrders'] == null) {
            await userRef.updateData({
              'newOrders': [
                'sellers/${product.sellerId}/orders/${user.uid}',
              ],
              'pastOrders': [],
            });
          } else {
            final newOrderList = userSnapshot.data['newOrders'] as List;
            newOrderList.add('sellers/${product.sellerId}/orders/${user.uid}');
            await userRef.updateData({'newOrders': newOrderList});
          }
        } else {
          final newOrderList = sellerOrdersSnapshot.data['newOrders'] as List;

          newOrderList.add(orderData);
          await ordersRef.updateData({'newOrders': newOrderList});

          final buyerSnapshot = await userRef.get();

          final newOrderListForUser = buyerSnapshot.data['newOrders'] as List;

          newOrderListForUser
              .add('sellers/${product.sellerId}/orders/${user.uid}');

          await userRef.updateData({'newOrders': newOrderListForUser});
        }
      }

      setState(() {
        _loading = false;
      });

      await userRef.updateData({'cartProducts': [], 'totalCartPrice': 0});

      for (int i = 0; i < widget.productList.length; i++) {
        Product product = widget.productList[i];

        final snapshot = await userRef.get();
        final historyList = snapshot.data['history'] as List;

        historyList.add({
          'action': 'You Ordered ${product.productName}}',
          'dateTime': DateTime.now(),
          'imageUrl': product.imageUrl,
        });

        await userRef.updateData({'history': historyList});
      }

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OrderPlaced()));
    } catch (e) {
      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }

    setState(() {
      _loading = false;
    });
  }

  int _generateOrderId() {
    return int.parse(
        DateTime.now().millisecondsSinceEpoch.toString().substring(0, 9));
  }

  @override
  void dispose() {
    super.dispose();
    _razorPay.clear();
  }
}

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                      backgroundColor: Colors.green,
                      child: Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 40,
                      )),
                ),
                Text(
                  "Ordered Succesfully\n",
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ),
                Text(
                  "Thank You So Much For \n Ordering\n\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                ButtonTheme(
                  height: 40,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {},
                    child: Text('Check Status'),
                  ),
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
        ),
      ),
      bottomSheet: Container(
        height: 85,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Center(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  height: 50,
                  width: width * .8,
                  child: FlatButton(
                      onPressed: () async {
                        final user = await FirebaseAuth.instance.currentUser();
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    HomePageScreen(userUid: user.uid)),
                            (route) => false);
                      },
                      child: Text(
                        "Continue Shopping",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )))),
        ),
      ),
    );
  }
}

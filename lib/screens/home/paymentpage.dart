import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class PaymentPage extends StatefulWidget {
  final String priceToPay;
  PaymentPage({@required this.priceToPay});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

enum PaymentMode { cod, paytm, card, gpay, upi }

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
          Expanded(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                height: 80,
                // color: Colors.redAccent.withOpacity(.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/10 (2).png'),
                    Expanded(
                      child: Text(
                        "Credit Card or Debit Card",
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                    Radio(
                      value: PaymentMode.card,
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
          ),
          Expanded(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/10 (3).png'),
                    Expanded(
                      child: Text(
                        "UPI",
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                    Radio(
                      value: PaymentMode.upi,
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
          ),
          Expanded(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/10 (4).png'),
                    Expanded(
                      child: Text(
                        "PayTM",
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                    Radio(
                      value: PaymentMode.paytm,
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
          ),
          Expanded(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                height: 80,
                // color: Colors.redAccent.withOpacity(.6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset('assets/10 (6).png'),
                    Expanded(
                      child: Text(
                        "Google Pay",
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                    Radio(
                      value: PaymentMode.gpay,
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
          ),
          Expanded(
            child: Card(
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
                        style: TextStyle(
                            fontSize: 20, fontStyle: FontStyle.italic),
                      ),
                    ),
                    Radio(
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
          ),
          Expanded(
            child: Container(
              color: Colors.green[700],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Pay ₹ ${widget.priceToPay}",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: width * .8,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AdressPage()));
                            },
                            child: Text(
                              "Pay Now",
                              style:
                                  TextStyle(color: Colors.green, fontSize: 17),
                            ))),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//Container(color: Colors.white,child: Center(child: Text("Buy Now",style: TextStyle(color: Colors.green,fontSize: 18),),))

class AdressPage extends StatefulWidget {
  @override
  _AdressPageState createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  final TextEditingController _nameController = TextEditingController(),
      _addressContoller = TextEditingController(),
      _pinController = TextEditingController(),
      _nearbyLandmark = TextEditingController(),
      _mobileContoller = TextEditingController(),
      _altMobileController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: Text(
          "Cash On Delivery",
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
                                content: Text('Please Fill All Fields First')));
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
                          final user =
                              await FirebaseAuth.instance.currentUser();
                          final snapshot = await Firestore.instance
                              .collection('users')
                              .document(user.uid)
                              .get();

                          final orderList = snapshot.data['orders'] as List;
                          orderList.add({
                            'name': _nameController.text,
                            'address': _addressContoller.text,
                            'pincode': _pinController.text,
                            'nearByLandMark': _nameController.text,
                            'mobile': _mobileContoller.text,
                            'alterMobile': _altMobileController.text,
                            'dateTime': DateTime.now(),
                          });

                          await Firestore.instance
                              .collection('users')
                              .document(user.uid)
                              .updateData({'orders': orderList});

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OrderPlaced()));
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
    );
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
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: 400,
            color: Colors.white.withOpacity(.6),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 40,
                    )),
                Text(
                  "Ordered Succesfully\n",
                  style: TextStyle(fontSize: 30, color: Colors.green),
                ),
                Text(
                  "Thank You So Much For \n Ordering\n\n",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                GestureDetector(
                  // onTap: (){Navigator.pushNamed(context, '/payment');},
                  child: Material(
                    child: Container(
                        height: 50,
                        width: width * .5,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Container(
                            color: Colors.green[700],
                            child: Center(
                              child: Text(
                                "Check Status",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ))),
                  ),
                ),
              ],
            )),
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/homescreen');
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

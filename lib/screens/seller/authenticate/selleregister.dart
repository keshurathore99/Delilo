import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/constants/decoration_constants.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/seller/authenticate/sellersignin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SellerRegisterScreen extends StatefulWidget {
  static const routeName = '/sellerRegisterPage';

  @override
  _SellerRegisterScreenState createState() => _SellerRegisterScreenState();
}

class _SellerRegisterScreenState extends State<SellerRegisterScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();
  final _attachIdController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String _otp;
  final _shopNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Container(
            width: wid,
            color: Color.fromRGBO(241, 243, 241, 1),
            /*decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/back.png'),fit: BoxFit.fitWidth)
            ),*/
            child: Form(
              child: ListView(
                /*    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,*/
                children: [
                  Container(
                      height: 120,
                      child: Image.asset(
                        "assets/images/dellologo.png",
                      )),
                  Container(
                    height: 200,
                    child: Align(
                      alignment: Alignment(0, -1),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            //color: Colors.,
                            width: wid * .80,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                keyboardType: TextInputType.name,
                                controller: _usernameController,
                                enableInteractiveSelection: true,
                                decoration:
                                    registerTextFieldDecoration.copyWith(
                                        hintText: 'Username',
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.black45,
                                        )),
                              ),
                            ),
                          ),
                          Container(
                            width: wid * .8,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailController,
                                enableInteractiveSelection: true,
                                decoration:
                                    registerTextFieldDecoration.copyWith(
                                        hintText: 'Email',
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.black45,
                                        )),
                              ),
                            ),
                          ),
                          Container(
                            width: wid * .8,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: _phoneController,
                                enableInteractiveSelection: true,
                                decoration:
                                    registerTextFieldDecoration.copyWith(
                                        hintText: 'Phone',
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: Colors.black45,
                                        )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    child: Align(
                      alignment: Alignment(.1, -1),
                      child: Container(
                        width: wid * .8,
                        color: Color.fromRGBO(241, 243, 241, 1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text("OTP Received"),
                            ),
                            Container(
                              color: Color.fromRGBO(241, 243, 241, 1),
                              width: 180,
                              //height: 200,
                              child: PinCodeTextField(
                                controller: _otpController,
                                length: 4,
                                obsecureText: false,
                                animationType: AnimationType.fade,
                                autoDisposeControllers: false,
                                pinTheme: PinTheme(
                                  selectedColor: Colors.grey,
                                  inactiveColor: Colors.grey,
                                  selectedFillColor: Colors.white,
                                  inactiveFillColor: Colors.white,
                                  shape: PinCodeFieldShape.circle,
                                  borderRadius: BorderRadius.circular(5),
                                  fieldHeight: 50,
                                  fieldWidth: 40,
                                  activeFillColor: Colors.white,
                                ),
                                backgroundColor: Colors.transparent,
                                enableActiveFill: true,
                                onChanged: (value) {
                                  setState(() {
                                    _otp = value;
                                  });
                                },
                                //errorAnimationController: errorController,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment(.6, -1),
                    child: Text(
                      "Resend OTP",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(12),
                            height: 5 * 20.0,
                            width: wid * .8,
                            child: Material(
                              elevation: 1,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                keyboardType: TextInputType.text,
                                controller: _addressController,
                                enableInteractiveSelection: true,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    hintText: "Type Your Address..."),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.,
                        width: wid * .80,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            controller: _attachIdController,
                            enableInteractiveSelection: true,
                            decoration: registerTextFieldDecoration.copyWith(
                                hintText:
                                    "Attach ID (in Backend implementation)",
                                prefixIcon: Icon(
                                  Icons.attach_file,
                                  color: Colors.black54,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        width: wid * .80,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            enableInteractiveSelection: true,
                            decoration: registerTextFieldDecoration.copyWith(
                                hintText: "Password",
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black54,
                                )),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4),
                        width: wid * .80,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.name,
                            controller: _shopNameController,
                            enableInteractiveSelection: true,
                            decoration: registerTextFieldDecoration.copyWith(
                                hintText: "Shop Name",
                                prefixIcon: Icon(
                                  Icons.person_pin,
                                  color: Colors.black54,
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: 50,
                            width: wid * .7,
                            child: FlatButton(
                                onPressed: () async {
                                  if (_usernameController.text.isEmpty ||
                                      _emailController.text.isEmpty ||
                                      _phoneController.text.isEmpty ||
                                      _addressController.text.isEmpty ||
                                      _attachIdController.text.isEmpty ||
                                      _otpController.text.isEmpty ||
                                      _passwordController.text.isEmpty ||
                                      _shopNameController.text.isEmpty) {
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Please Fill All Fields First')));
                                    return;
                                  }

                                  if (!_emailController.text.contains('@')) {
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Please Enter a Valid Email')));
                                    return;
                                  }

                                  if (_passwordController.text.length < 5) {
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Password Length is Too Small')));
                                    return;
                                  }

                                  if (_otp == null) {
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Please Enter an OTP First')));
                                    return;
                                  }

                                  Map map = {
                                    'email': _emailController.text,
                                    'username': _usernameController.text,
                                    'phone': _phoneController.text,
                                    'location': _addressController.text,
                                    'attachId': _attachIdController.text,
                                    'password': _passwordController.text,
                                    'shop_name': _shopNameController.text,
                                  };

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          GetGstDetails(signUpInfo: map)));

                                  try {} on PlatformException catch (e) {
                                    _scaffoldKey.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text(e.code),
                                    ));
                                  } catch (e) {
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(content: Text(e.toString())));
                                  }
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                ))),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SellerSigninScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              children: [
                                TextSpan(text: "Already Have an Account? "),
                                TextSpan(
                                    text: "Login",
                                    style: TextStyle(color: Colors.green))
                              ])),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GetGstDetails extends StatefulWidget {
  final Map signUpInfo;
  GetGstDetails({this.signUpInfo});

  @override
  _GetGstDetailsState createState() => _GetGstDetailsState();
}

enum GstOption { have, gstexempt, willapply }

class _GetGstDetailsState extends State<GetGstDetails> {
  GstOption selected = GstOption.have;
  final _gstNumberController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                    height: 120,
                    child: Image.asset(
                      "assets/images/dellologo.png",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Give Your Business Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.grey[100].withOpacity(.6),
                    height: 40,
                    width: wid * .6,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: GstOption.have,
                          groupValue: selected,
                          onChanged: (GstOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "  I Have A GSTIN                          ",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 40,
                    width: wid * .6,
                    color: Colors.grey[100].withOpacity(.6),
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: GstOption.gstexempt,
                          groupValue: selected,
                          onChanged: (GstOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Will Only Sell In GST Exempt Categories",
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.grey[100].withOpacity(.6),
                    height: 40,
                    width: wid * .6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Radio(
                          value: GstOption.willapply,
                          groupValue: selected,
                          onChanged: (GstOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Have Applied/Will Apply for GSTIN",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: wid * .75,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          controller: _gstNumberController,
                          enableInteractiveSelection: true,
                          decoration: registerTextFieldDecoration.copyWith(
                              hintText: 'Verify GSTIN',
                              prefixIcon: Opacity(
                                  opacity: 0, child: Icon(Icons.donut_large))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 58.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: wid * .7,
                        child: FlatButton(
                            onPressed: () {
                              if (selected == GstOption.willapply) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => GetBankDetails(
                                          gstDetails: widget.signUpInfo,
                                        )));
                                return;
                              }

                              if (_gstNumberController.text.isEmpty) {
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Please Enter GSTIN')));
                                return;
                              }

                              widget.signUpInfo['gstin_number'] =
                                  _gstNumberController.text;

                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => GetBankDetails(
                                      gstDetails: widget.signUpInfo)));
                            },
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum BankOption { havesamenamebank, donthavesamename }

class GetBankDetails extends StatefulWidget {
  final Map gstDetails;
  GetBankDetails({this.gstDetails});

  @override
  _GetBankDetailsState createState() => _GetBankDetailsState();
}

class _GetBankDetailsState extends State<GetBankDetails> {
  BankOption selected = BankOption.donthavesamename;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _accountHolderName = TextEditingController();
  final _bankAccountNumber = TextEditingController();
  final _ifscCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);

    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                    height: 120,
                    child: Image.asset(
                      "assets/images/dellologo.png",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Give Your Business Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.grey[100].withOpacity(.6),
                    height: 40,
                    width: wid * .6,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: BankOption.havesamenamebank,
                          groupValue: selected,
                          onChanged: (BankOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Have A Bank Account In\n My Registered Business Name",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 40,
                    width: wid * .6,
                    color: Colors.grey[100].withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Radio(
                          value: BankOption.donthavesamename,
                          groupValue: selected,
                          onChanged: (BankOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Will/Have Apply for bank account in\n name of registered businees ",
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: wid * .75,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          controller: _accountHolderName,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: "Enter Account Holder's Name"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: wid * .75,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          controller: _bankAccountNumber,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: "Enter Bank Account Number"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: wid * .75,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          controller: _ifscCodeController,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              hintText: "Enter IFSC"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  "Don't Know GST",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: wid * .7,
                        child: FlatButton(
                            onPressed: () {
                              if (selected == BankOption.donthavesamename) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CollectSignPage(
                                          bankDetails: widget.gstDetails,
                                        )));
                                return;
                              }

                              if (selected == BankOption.havesamenamebank) {
                                if (_accountHolderName.text.isEmpty ||
                                    _bankAccountNumber.text.isEmpty ||
                                    _ifscCodeController.text.isEmpty) {
                                  _scaffoldKey.currentState.showSnackBar(SnackBar(
                                      content: Text(
                                          'Please Fill All The Fields First')));
                                  return;
                                }

                                widget.gstDetails['account_name'] =
                                    _accountHolderName.text;
                                widget.gstDetails['account_number'] =
                                    _bankAccountNumber.text;
                                widget.gstDetails['ifsc_code'] =
                                    _ifscCodeController.text;

                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CollectSignPage(
                                        bankDetails: widget.gstDetails)));
                              }
                            },
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum SignOption { upload, signhere }

class CollectSignPage extends StatefulWidget {
  final Map bankDetails;
  CollectSignPage({this.bankDetails});

  @override
  _CollectSignPageState createState() => _CollectSignPageState();
}

class _CollectSignPageState extends State<CollectSignPage> {
  SignOption selected = SignOption.signhere;
  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                    height: 120,
                    child: Image.asset(
                      "assets/images/dellologo.png",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Give Your Business Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.grey[100].withOpacity(.6),
                    height: 40,
                    width: wid * .6,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: SignOption.signhere,
                          groupValue: selected,
                          onChanged: (SignOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Want To Draw Sign On Screen",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 40,
                    width: wid * .6,
                    color: Colors.grey[100].withOpacity(.6),
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: SignOption.upload,
                          groupValue: selected,
                          onChanged: (SignOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Want To Upload Sign. ",
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 24.0,
                width: wid * .8,
                child: Material(
                  elevation: 1,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: "Click here To sign"),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SellerVerificationPage(
                            allInfo: widget.bankDetails,
                          )));
                },
                child: Align(
                  alignment: Alignment(.9, -1),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "SKIP",
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: wid * .7,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => SellerVerificationPage(
                                        allInfo: widget.bankDetails,
                                      )));
                            },
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SellerVerificationPage extends StatefulWidget {
  final Map allInfo;
  SellerVerificationPage({this.allInfo});

  @override
  _SellerVerificationPageState createState() => _SellerVerificationPageState();
}

class _SellerVerificationPageState extends State<SellerVerificationPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;
  final _loginController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Scaffold(
          key: _scaffoldKey,
          body: Center(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15.0),
                      child: Container(
                          height: 120,
                          child: Image.asset(
                            "assets/images/dellologo.png",
                          )),
                    ),
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: 300,
                        width: width * .9,
                        child: Text(
                            "\n\n\nEMAIL VERIFICATION\n\n\nWe Have Sent A Email With Subject Line (Dellilo MarketPlace)-Email Verification To Your Registered Email Adreess\nPlease Open The Email And Click On The Verification Link\n\nThe Verification link expires in 24 hours.If Its Is expired Please Click her to send again"),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 5,
                      margin: EdgeInsets.all(10),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(7.0),
                    ),
                    Card(
                      semanticContainer: true,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Container(
                        height: 180,
                        width: width * .9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 38.0),
                              child: Text(
                                  "Tracking Card\n\nOnly Possible To Implement With The Backend.\n Will be implemented with backend"),
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
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: MaterialButton(
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Colors.green,
                        onPressed: () async {
                          try {
                            setState(() {
                              _loading = true;
                            });

                            final authResult = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: widget.allInfo['email'],
                                    password: widget.allInfo['password']);

                            print(authResult.user.uid);

                            if (authResult.user != null) {
                              widget.allInfo['uid'] = authResult.user.uid;
                              widget.allInfo['type'] = 'Seller';

                              final Map<String, dynamic> map = {};

                              widget.allInfo.forEach((key, value) {
                                map[key] = value;
                              });

                              Firestore.instance
                                  .collection('sellers')
                                  .document(authResult.user.uid)
                                  .setData(map);

                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text('Registered Successfully')));

                              setState(() {
                                _loading = false;
                              });

                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SellerSigninScreen()));
                            } else {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'There is Some Error Please Tru Again Later')));
                              return;
                            }
                          } on PlatformException catch (e) {
                            setState(() {
                              _loading = false;
                            });
                            if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE' ||
                                e.code == 'ERROR_INVALID_EMAIL') {
                              await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      contentPadding: EdgeInsets.all(20),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      title: Text(e.code ==
                                              'ERROR_EMAIL_ALREADY_IN_USE'
                                          ? 'The Email is Already Registered Please Choose Another Email or Login Do Login'
                                          : 'The Email You Entered is Invalid Please Try Again'),
                                      actions: [
                                        FlatButton(
                                          onPressed: () {
                                            Navigator.of(context).pushReplacement(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SellerSigninScreen()));
                                          },
                                          child: Text('Login'),
                                          textColor: Colors.green,
                                        ),
                                        RaisedButton(
                                          onPressed: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    elevation: 8,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                              'Other Email Id'),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: TextField(
                                                              keyboardType:
                                                                  TextInputType
                                                                      .emailAddress,
                                                              controller:
                                                                  _loginController,
                                                              decoration: registerTextFieldDecoration
                                                                  .copyWith(
                                                                      hintText:
                                                                          'Change Email',
                                                                      prefixIcon:
                                                                          Icon(
                                                                        Icons
                                                                            .email,
                                                                        color: Colors
                                                                            .black54,
                                                                      )),
                                                            ),
                                                          ),
                                                          Align(
                                                            alignment: Alignment
                                                                .centerRight,
                                                            child: RaisedButton(
                                                              shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                              textColor:
                                                                  Colors.white,
                                                              onPressed:
                                                                  () async {
                                                                if (_loginController
                                                                    .text
                                                                    .isEmpty) {
                                                                  _scaffoldKey
                                                                      .currentState
                                                                      .showSnackBar(SnackBar(
                                                                          content:
                                                                              Text('Please Enter a Valid Email')));
                                                                  return;
                                                                }

                                                                if (!_loginController
                                                                    .text
                                                                    .contains(
                                                                        '@')) {
                                                                  _scaffoldKey
                                                                      .currentState
                                                                      .showSnackBar(SnackBar(
                                                                          content:
                                                                              Text('Enter a Valid Email')));
                                                                  return;
                                                                }

                                                                setState(() {
                                                                  widget.allInfo[
                                                                          'email'] =
                                                                      _loginController
                                                                          .text;
                                                                });
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              color:
                                                                  Colors.green,
                                                              child: Text(
                                                                  'Change'),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                });
                                          },
                                          child: Text('Change Email'),
                                          textColor: Colors.white,
                                          color: Colors.green,
                                        ),
                                      ],
                                    );
                                  });
                            }
                            return;
                          } catch (e) {
                            setState(() {
                              _loading = false;
                            });
                            _scaffoldKey.currentState.showSnackBar(
                                SnackBar(content: Text(e.toString())));
                            return;
                          }
                        },
                        child: Text('Register'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

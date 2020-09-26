import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/constants/decoration_constants.dart';
import 'package:delilo/screens/authenticate/getlocation.dart';
import 'package:delilo/screens/authenticate/signin.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

class AuthenticateScreen extends StatefulWidget {
  static const routeName = '/authenticate';
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

FirebaseUser user;

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final _otpController = new TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;
  String _otp;
  bool _otpSent = false;
  final _googleSignIn = GoogleSignIn();
  TwilioFlutter _twilioFlutter;

  @override
  void initState() {
    super.initState();
    _twilioFlutter = TwilioFlutter(
        accountSid: 'AC32f01a582a21fe98bd97f62d20ef4560',
        authToken: '455c0018476e367a1b8824ff98db4f7d',
        twilioNumber: '+12059904780');
  }

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Scaffold(
          key: _scaffoldKey,
          body: Center(
            child: Container(
              width: wid,
              color: Color.fromRGBO(241, 243, 241, 1),
              child: Form(
                child: ListView(
                  /*    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,*/
                  children: [
                    Container(
                        height: 120,
                        child: Image.asset(
                          "assets/dellologo.png",
                        )),
                    Container(
                      height: 240,
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
                                  controller: _userNameController,
                                  enableInteractiveSelection: true,
                                  decoration:
                                      registerTextFieldDecoration.copyWith(
                                          hintText: 'Username',
                                          prefixIcon: Icon(
                                            Icons.person,
                                            color: Colors.black54,
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
                                            color: Colors.black54,
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
                                  // key: _mobilenumberkey,
                                  controller: _phoneController,
                                  enableInteractiveSelection: true,
                                  decoration:
                                      registerTextFieldDecoration.copyWith(
                                          hintText: 'Phone',
                                          prefixIcon: Icon(
                                            Icons.phone,
                                            color: Colors.black54,
                                          )),
                                  keyboardType: TextInputType.phone,
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
                                padding: const EdgeInsets.only(
                                    bottom: 10.0, right: 8),
                                child: Text("OTP Received"),
                              ),
                              Expanded(
                                child: Container(
                                  color: Color.fromRGBO(241, 243, 241, 1),
                                  child: PinCodeTextField(
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
                                      fieldHeight: 30,
                                      fieldWidth: 30,
                                      activeFillColor: Colors.white,
                                    ),
                                    backgroundColor: Colors.transparent,
                                    enableActiveFill: true,
                                    controller: _otpController,
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment(.6, -1),
                      child: GestureDetector(
                        onTap: () async {
                          _phoneController.text = _phoneController.text.trim();
                          if (_phoneController.text.length != 10 ||
                              _phoneController.text.isEmpty) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content:
                                    Text('Please Enter a Valid Phone Number')));
                            return;
                          }
                          setState(() {
                            _otpSent = true;
                          });
                          try {
                            _otp = Random().nextInt(9999).toString();
                            while (_otp.length != 4) {
                              _otp = Random().nextInt(9999).toString();
                            }
                            _twilioFlutter.sendSMS(
                                toNumber: '+91${_phoneController.text}',
                                messageBody: 'Your OTP is $_otp');
                          } catch (e) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text(
                                  e.toString() + "\nAuthentication Failed"),
                            ));
                          }
                        },
                        child: Text(
                          _otpSent == true ? 'Resend OTP' : 'Get OTP',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      // child: Text("Send OTP",style: TextStyle(color: Colors.green),)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: wid * .8,
                          height: 45,
                          child: Material(
                            elevation: 5,
                            shape: StadiumBorder(),
                            child: TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.visiblePassword,
                              controller: _passwordController,
                              enableInteractiveSelection: true,
                              decoration: registerTextFieldDecoration.copyWith(
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black54,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                    FlatButton(
                        onPressed: () {},
                        child: Align(
                          alignment: Alignment(0, -1),
                          child: Text("Or Register By"),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/j.png'),
                                fit: BoxFit.fitHeight),
                          ),
                          child: Align(
                              alignment: Alignment(0.3, -.15),
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )),
                        ),
                        InkWell(
                          onTap: () async {
                            final user = await signInWithGoogle();
                            if (user == null || user.uid == null) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content: Text(
                                      'There is Some Problem in Register Please Try Again')));
                              return;
                            }

                            final userSnapshot = await Firestore.instance
                                .collection('users')
                                .document(user.uid)
                                .get();

                            if (userSnapshot == null ||
                                userSnapshot.data == null) {
                              final Map<String, dynamic> map = {
                                'email': user.email,
                                'password': '12121212',
                                'name': user.displayName,
                                'phone': user.phoneNumber ?? 'null',
                                'cartProducts': [],
                                'type': 'Buyer',
                                'history': [],
                              };

                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return GetLocationPage(
                                  loginDetails: map,
                                  isGoogleSignedIn: true,
                                );
                              }));
                            } else {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => HomePageScreen(
                                            userUid: user.uid,
                                          )));
                            }
                          },
                          child: Container(
                            width: 150,
                            height: 80,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/p.png'),
                                  fit: BoxFit.fitHeight),
                            ),
                            child: Align(
                                alignment: Alignment(0.3, -.15),
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                )),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: 40,
                            width: wid * .5,
                            child: FlatButton(
                                onPressed: () async {
                                  if (_emailController.text.isEmpty &&
                                      _passwordController.text.isEmpty &&
                                      _phoneController.text.isEmpty &&
                                      _userNameController.text.isEmpty) {
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            'Please Fill All of The Fields First')));
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

                                  if (_phoneController.text.length != 10) {
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            'Please Enter a Valid Phone Number')));
                                  }

                                  print(
                                      'textfield text ' + _otpController.text);
                                  print('otp ' + _otp);

                                  if (_otpController.text != _otp) {
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            'Your Entered OTP is Wrong Please Try Again')));
                                    return;
                                  }

                                  setState(() {
                                    _loading = true;
                                  });

                                  final Map<String, dynamic> map = {
                                    'email': _emailController.text,
                                    'password': _passwordController.text,
                                    'name': _userNameController.text,
                                    'phone': _phoneController.text,
                                    'cartProducts': [],
                                    'type': 'Buyer',
                                    'history': [],
                                  };

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => GetLocationPage(
                                                loginDetails: map,
                                              )));
                                },
                                child: Text("Register",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18.0)))),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => SigninPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 18.0, top: 10),
                        child: Align(
                            alignment: Alignment.bottomCenter,
                            child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 16.0),
                                    children: [
                                  TextSpan(text: "Already have a Account? "),
                                  TextSpan(
                                      text: "Login",
                                      style: TextStyle(color: Colors.green))
                                ]))),
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

  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;
    final FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();

    return currentUser;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/constants/decoration_constants.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:delilo/screens/authenticate/getlocation.dart';
import 'package:delilo/screens/authenticate/signin.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class AuthenticateScreen extends StatefulWidget {
  static const routeName = '/authenticate';
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

FirebaseUser user;

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  // final GlobalKey<FormFieldState> __passwordkey=GlobalKey<FormFieldState>();
  // final GlobalKey<FormFieldState> _usernamekey=GlobalKey<FormFieldState>();
  // final GlobalKey<FormFieldState> _emailkey=GlobalKey<FormFieldState>();
  // final GlobalKey<FormFieldState> _mobilenumberkey=GlobalKey<FormFieldState>();

  String currentText;
  TextEditingController textEditingController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final otpController = new TextEditingController();

  // Registration variables
  String smsCode, verificationId;
  bool codeSent = false;
  bool verified = false;
  bool registered = false;
  bool canRegister = false;
  AuthCredential loginKey;

  final key = GlobalKey<ScaffoldState>();
  bool _loading = false;
//  final flutterOtp = FlutterOtp();
  String otp;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Scaffold(
          key: key,
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
                                  controller: userNameController,
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
                                  controller: emailController,
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
                                  controller: phoneController,
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
                                    controller: textEditingController,
                                    onCompleted: (v) {
                                      print("Completed");
                                    },
                                    onChanged: (value) {
                                      print(value);
                                      setState(() {
                                        otp = value;
                                      });
                                    },
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
                        onTap: () {
//                          if (phoneController.text.isEmpty ||
//                              emailController.text.isEmpty ||
//                              userNameController.text.isEmpty ||
//                              passwordController.text.isEmpty) {
//                            key.currentState.showSnackBar(SnackBar(
//                                content:
//                                    Text('Please Fill All The Fields First')));
//                            return;
//                          }
                          phoneController.text = phoneController.text.trim();
                          if (phoneController.text.length != 10 ||
                              phoneController.text.isEmpty) {
                            key.currentState.showSnackBar(SnackBar(
                                content:
                                    Text('Please Enter a Valid Phone Number')));
                            return;
                          }
                          try {
//                            flutterOtp.sendOtp(
//                              phoneController.text,
//                            );
                          } catch (e) {
                            key.currentState.showSnackBar(SnackBar(
                              content: Text(
                                  e.toString() + "\nAuthentication Failed"),
                            ));
                          }

//                          codeSent
//                              ? AuthService()
//                                  .signWithOTP(smsCode, verificationId)
//                              : verifyPhone("+91" + phoneController.text);

//                          if (verified) {
//                            setState(() {
//                              key.currentState.showSnackBar(SnackBar(
//                                content: Text('Phone Number Verified !'),
//                              ));
//                            });
//                          }
                        },
                        child: Text('Get OTP'),
//                      child: codeSent
//                          ? Text("Submit the OTP Code",
//                              style: TextStyle(color: Colors.green))
//                          : Text("Get OTP",
//                              style: TextStyle(color: Colors.green)),
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
                              controller: passwordController,
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
                        Container(
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
//                                  if (canRegister == true) {
//                                  if (smsCode != otpController.text) {
//                                    key.currentState.showSnackBar(SnackBar(
//                                        content: Text('OTP Not Matched')));
//                                    return;
//                                  }
                                  if (emailController.text.isEmpty &&
                                      passwordController.text.isEmpty &&
                                      phoneController.text.isEmpty &&
                                      userNameController.text.isEmpty) {
                                    key.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            'Please Fill All of The Fields First')));
                                    return;
                                  }

                                  if (!emailController.text.contains('@')) {
                                    key.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            'Please Enter a Valid Email')));
                                    return;
                                  }

                                  if (passwordController.text.length < 5) {
                                    key.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            'Password Length is Too Small')));
                                    return;
                                  }

                                  if (otp == null) {
                                    key.currentState.showSnackBar(SnackBar(
                                        content:
                                            Text('Please Enter an OTP First')));
                                    return;
                                  }

                                  bool result = false;

                                  try {
//                                    result = flutterOtp
//                                        .resultChecker(int.parse(otp));
                                  } catch (e) {
                                    key.currentState.showSnackBar(
                                        SnackBar(content: Text(e)));
                                    return;
                                  }

//                                  if (result == false) {
//                                    key.currentState.showSnackBar(SnackBar(
//                                        content: Text(
//                                            'Your Entered OTP is Wrong Please Try Again')));
//                                    return;
//                                  }

                                  try {
                                    setState(() {
                                      _loading = true;
                                    });
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: emailController.text,
                                              password:
                                                  passwordController.text);
                                    } on PlatformException catch (e) {
                                      key.currentState.showSnackBar(
                                          SnackBar(content: Text(e.code)));
                                      return;
                                    } catch (e) {
                                      key.currentState.showSnackBar(
                                          SnackBar(content: Text(e)));
                                      return;
                                    }

                                    final user = await FirebaseAuth.instance
                                        .currentUser();

                                    if (user != null) {
                                      await Firestore.instance
                                          .collection('users')
                                          .document(user.uid)
                                          .setData({
                                        'name': userNameController.text,
                                        'email': emailController.text,
                                        'phone': phoneController.text,
                                        'uid': user.uid,
                                        'cartProducts': [],
                                      });
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  GetLocationPage()));
                                    } else {
                                      key.currentState.showSnackBar(SnackBar(
                                          content: Text(
                                              'There is Some Problem Please Try Later')));
                                    }

                                    setState(() {
                                      _loading = false;
                                    });
                                  } on PlatformException catch (e) {
                                    setState(() {
                                      _loading = false;
                                    });
                                    key.currentState.showSnackBar(
                                        SnackBar(content: Text(e.code)));
                                  } catch (e) {
                                    key.currentState.showSnackBar(
                                        SnackBar(content: Text(e)));
                                  }

//                                  } else {
//                                    key.currentState.showSnackBar(SnackBar(
//                                      content: Text(
//                                          'Please Fill All The Fields First'),
//                                    ));
//                                  }
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

  Future<void> verifyPhone(phoneNo) async {
    final PhoneVerificationCompleted verified =
        (AuthCredential authResult) async {
      // AuthService().signIn(authResult);
      FirebaseAuth.instance
          .signInWithCredential(authResult)
          .then((usser) async {
        if (emailController != null &&
            phoneController != null &&
            userNameController != null &&
            passwordController != null) {
          canRegister = true;
        }
        await FirebaseAuth.instance.currentUser().then((value) {
          user = value;
        });

//        final myPosition =
//            await GeolocatorPlatform.instance.getCurrentPosition();
//        final myLatitude = myPosition.latitude;
//        final myLongitude = myPosition.longitude;

        await Firestore.instance
            .collection('users')
            .document(usser.user.uid)
            .setData({
          "email": emailController.text,
          "phone": phoneController.text,
          "username": userNameController.text,
          "uid": usser.user.uid,
        });
      });
      setState(() async {
        this.verified = true;
        this.loginKey = authResult;
        otpController.text = smsCode;
      });
    };

    print(smsCode);

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}' +
          '***************************************');

      if (registered)
        key.currentState.showSnackBar(SnackBar(
          content: new Text('Already Registered please try Login'),
        ));

      registered = false;
    };

    final PhoneCodeSent smsSent = (String verId, [int forceResend]) {
      this.verificationId = verId;
      setState(() {
        this.codeSent = true;
      });
    };

    final PhoneCodeAutoRetrievalTimeout autoTimeout = (String verId) {
      this.verificationId = verId;
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNo,
        timeout: const Duration(seconds: 60),
        verificationCompleted: verified,
        verificationFailed: verificationfailed,
        codeSent: smsSent,
        codeAutoRetrievalTimeout: autoTimeout);
  }
}

/*
SizedBox(
width: wid*.8,
child: Material(
elevation: 5,
shape: StadiumBorder(),
child: TextFormField(
key: __passwordkey,
enableInteractiveSelection: true,
decoration: InputDecoration(

border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
prefixIcon: Padding(
padding: const EdgeInsets.fromLTRB(10,0,10,0),
child: Icon(Icons.lock,size: 35,color: Colors.black.withOpacity(.75),),
),
hintText: "Enter Password"
),
validator: (value){},
),
),
),*/

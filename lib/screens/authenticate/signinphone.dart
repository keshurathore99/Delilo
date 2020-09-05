import 'package:delilo/screens/authenticate/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SigninPhonePage extends StatefulWidget {
  @override
  _SigninPhonePageState createState() => _SigninPhonePageState();
}

class _SigninPhonePageState extends State<SigninPhonePage> {
  String currentText;
  TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 240,
                  child: Image.asset(
                    "assets/dellologo.png",
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  width: wid * .8,
                  child: Material(
                    elevation: 5,
                    shape: StadiumBorder(),
                    child: TextFormField(
                      // key: __passwordkey,
                      enableInteractiveSelection: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Icon(
                              Icons.mobile_screen_share,
                              size: 35,
                              color: Colors.black.withOpacity(.75),
                            ),
                          ),
                          hintText: 'Mobile Number'),
                      validator: (value) {
                        if (value.isEmpty) return 'Please Enter Some Value';
                        return null;
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  height: 50,
                  child: Align(
                    alignment: Alignment(.1, -1),
                    child: Container(
                      width: wid * .8,
                      // color: Color.fromRGBO(241,243,241, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: Text("OTP Received"),
                          ),
                          Container(
                            //color: Color.fromRGBO(241,243,241, 1),
                            width: 180,
                            //height: 200,
                            child: PinCodeTextField(
                              length: 4,
                              obsecureText: false,
                              animationType: AnimationType.fade,
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
                              //animationDuration: Duration(milliseconds: 300),
                              backgroundColor: Colors.transparent,
                              enableActiveFill: true,
                              //errorAnimationController: errorController,
                              controller: _otpController,
                              onCompleted: (v) {
                                print("Completed");
                              },
                              onChanged: (value) {
                                print(value);
                                setState(() {
                                  currentText = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
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
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SigninPage(),
                    ));
                  },
                  child: Align(
                    alignment: Alignment(0, -1),
                    child: Text("Or Login By Email"),
                  )),
              Container(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 150,
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/j.png'),
                            fit: BoxFit.fitHeight),
                      ),
                      child: Align(
                          alignment: Alignment(0.3, -.15),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    ),
                    Container(
                      width: 150,
                      height: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/p.png'),
                            fit: BoxFit.fitHeight),
                      ),
                      child: Align(
                          alignment: Alignment(0.3, -.15),
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    ),
                  ],
                ),
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  height: 40,
                  width: wid * .5,
                  child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/homescreen');
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white),
                      ))),
              GestureDetector(
                onTap: () {
                  //todo: Login By Mobile Number
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              children: [
                            TextSpan(text: "Don't Have an Account? "),
                            TextSpan(
                                text: "Register",
                                style: TextStyle(color: Colors.green))
                          ]))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

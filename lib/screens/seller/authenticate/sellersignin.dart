import 'package:delilo/constants/decoration_constants.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/seller/authenticate/selleregister.dart';
import 'package:delilo/screens/seller/home/sellerhomesceen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SellerSigninScreen extends StatefulWidget {
  static const routeName = '/sellerSignInScreen';

  @override
  _SellerSigninScreenState createState() => _SellerSigninScreenState();
}

class _SellerSigninScreenState extends State<SellerSigninScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return WillPopScope(
      onWillPop: () {
        SystemNavigator.pop();
        return;
      },
      child: ModalProgressHUD(
        inAsyncCall: loading,
        child: Scaffold(
          key: _scaffoldKey,
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 28.0),
                    child: Container(
                        height: 200,
                        child: Image.asset(
                          "assets/images/dellologo.png",
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      "LOGIN",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50.0),
                        child: Container(
                          width: wid * .8,
                          child: Material(
                            elevation: 5,
                            shape: StadiumBorder(),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              enableInteractiveSelection: true,
                              decoration: registerTextFieldDecoration.copyWith(
                                  hintText: 'Email',
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.black45,
                                  )),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: wid * .8,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            obscureText: true,
                            enableInteractiveSelection: true,
                            decoration: registerTextFieldDecoration.copyWith(
                                hintText: 'Password',
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.black45,
                                )),
                          ),
                        ),
                      ),
                    ],
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
                            height: 55,
                            width: wid * .75,
                            child: FlatButton(
                                onPressed: () async {
                                  if (_emailController.text.isEmpty ||
                                      _passwordController.text.isEmpty) {
                                    _scaffoldKey.currentState.showSnackBar(SnackBar(
                                        content: Text(
                                            'Please Fill All The Fields First')));
                                    return;
                                  }

                                  if (_passwordController.text.length < 5) {
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Password Is Very Short')));
                                    return;
                                  }

                                  if (!_emailController.text.contains('@')) {
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                            content: Text(
                                                'Please Enter a Valid Email')));
                                    return;
                                  }

                                  try {
                                    setState(() {
                                      loading = true;
                                    });
                                    final auth = await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _passwordController.text);
                                    final user = await FirebaseAuth.instance
                                        .currentUser();

                                    if (auth.user != null) {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SellerHomeScreen(
                                                    userUid: user.uid,
                                                  )));
                                    }
                                    setState(() {
                                      loading = false;
                                    });
                                  } on PlatformException catch (e) {
                                    setState(() {
                                      loading = false;
                                    });
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(content: Text(e.code)));
                                  } catch (e) {
                                    setState(() {
                                      loading = false;
                                    });
                                    _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(content: Text(e.toString())));
                                  }
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ))),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SellerRegisterScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              children: [
                            TextSpan(text: "Dont have a Account? "),
                            TextSpan(
                                text: "Register",
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

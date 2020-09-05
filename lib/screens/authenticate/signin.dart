import 'package:delilo/screens/authenticate/authenticate.dart';
import 'package:delilo/screens/authenticate/signinphone.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninPage extends StatelessWidget {
  static const routeName = '/signInPage';

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      key: _scaffoldKey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  height: 250,
                  child: Image.asset(
                    "assets/images/dellologo.png",
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Container(
                  width: wid * .8,
                  child: Material(
                    elevation: 5,
                    shape: StadiumBorder(),
                    child: TextFormField(
                      controller: _emailController,
                      enableInteractiveSelection: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 4),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Icon(
                              Icons.email,
                              size: 35,
                              color: Colors.black.withOpacity(.75),
                            ),
                          ),
                          hintText: "Enter Email"),
                      validator: (value) {},
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
                    obscureText: true,
                    controller: _passwordController,
                    enableInteractiveSelection: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Icon(
                            Icons.lock,
                            size: 35,
                            color: Colors.black.withOpacity(.75),
                          ),
                        ),
                        hintText: "Enter Password"),
                    validator: (value) {},
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SigninPhonePage()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    "Or Login by Mobile Number",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
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
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          )),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      width: wid * .8,
                      child: FlatButton(
                          onPressed: () async {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                      Text('Please Fill The Above Fields')));
                              return;
                            }
                            if (_passwordController.text.length < 6) {
                              _scaffoldKey.currentState.showSnackBar(SnackBar(
                                  content:
                                      Text('Password Length is Very Small')));
                              return;
                            }
                            final result = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: _passwordController.text);
                            if (result.user.uid != null) {
                              Navigator.pushReplacementNamed(
                                  context, '/homescreen');
                              _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text('Login Successful')));
                            } else {
                              _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text('Login Failed')));
                            }
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          ))),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AuthenticateScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: RichText(
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              children: [
                            TextSpan(text: "Don't have a Account? "),
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

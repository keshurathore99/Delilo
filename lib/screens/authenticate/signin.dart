import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/constants/decoration_constants.dart';
import 'package:delilo/screens/authenticate/authenticate.dart';
import 'package:delilo/screens/authenticate/getlocation.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/home/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class SigninPage extends StatefulWidget {
  static const routeName = '/signInPage';

  @override
  _SigninPageState createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return ModalProgressHUD(
      inAsyncCall: loading,
      child: Scaffold(
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
                      obscureText: true,
                      controller: _passwordController,
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
//                GestureDetector(
//                  onTap: () {
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => SigninPhonePage()));
//                  },
//                  child: Padding(
//                    padding: const EdgeInsets.only(top: 20.0),
//                    child: Text(
//                      "Or Login by Mobile Number",
//                      style: TextStyle(fontSize: 20),
//                    ),
//                  ),
//                ),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            )),
                      ),
                      InkWell(
                        onTap: () async {
                          final user = await signInWithGoogle();
                          if (user == null || user.uid == null) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    'Sorry But There is Some Problem in Google Login')));
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
                            Navigator.of(context).push(MaterialPageRoute(
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
                                "Login",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              )),
                        ),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
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
                              try {
                                setState(() {
                                  loading = true;
                                });
                                final result = await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: _emailController.text,
                                        password: _passwordController.text);
                                if (result.user != null) {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HomePageScreen(
                                                userUid: result.user.uid,
                                              )));
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(
                                          content: Text('Login Successful')));
                                  setState(() {
                                    loading = false;
                                  });
                                } else {
                                  _scaffoldKey.currentState.showSnackBar(
                                      SnackBar(content: Text('Login Failed')));
                                  setState(() {
                                    loading = false;
                                  });
                                }
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

import 'package:delilo/screens/authenticate/signin.dart';
import 'package:delilo/screens/seller/authenticate/sellersignin.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class Wrapper extends StatefulWidget {
  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        body: /*FashionMainPage(),*/ Center(
          child: Container(
            width: wid,
            height: hit,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back.png'),
                    fit: BoxFit.fitWidth)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Container(
                      height: 200,
                      child: Image.asset(
                        "assets/dellologo.png",
                      )),
                ),
                Container(
                    padding: EdgeInsets.only(bottom: 50),
                    child: RaisedButton(
                      padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                      elevation: 5,
                      color: Colors.white,
                      shape: StadiumBorder(),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SigninPage()));
                      },
                      child: Text("I am a Buyer"),
                    )),
                Container(
                    child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                  elevation: 5,
                  color: Colors.white,
                  shape: StadiumBorder(),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SellerSigninScreen()));
                  },
                  child: Text("I am a Seller"),
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

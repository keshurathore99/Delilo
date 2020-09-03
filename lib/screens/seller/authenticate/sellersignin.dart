import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class SellerSigninScreen extends StatefulWidget {
  @override
  _SellerSigninScreenState createState() => _SellerSigninScreenState();
}

class _SellerSigninScreenState extends State<SellerSigninScreen> {
  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom:28.0),
              child: Container(height: 200,child: Image.asset("assets/images/dellologo.png",)),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: Text("LOGIN",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:50.0),
                  child: Container(
                    width: wid*.8,
                    child: Material(
                      elevation: 5,
                      shape: StadiumBorder(),
                      child: TextFormField(
                        //key: _mobilenumberkey,
                        enableInteractiveSelection: true,
                        decoration: InputDecoration(

                            border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.fromLTRB(10,0,10,0),
                              child: Icon(Icons.email,size: 35,color: Colors.black.withOpacity(.75),),
                            ),
                            hintText: "Enter Email"
                        ),
                        validator: (value){},
                      ),
                    ),
                  ),
                ),
                Container(
                  width: wid*.8,
                  child: Material(
                    elevation: 5,
                    shape: StadiumBorder(),
                    child: TextFormField(
                      //key: _mobilenumberkey,
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
                ),
              ],
            ),


            Padding(
              padding: const EdgeInsets.only(top:58.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 55,width:wid*.75,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/sellerhome');}, child: Text("Sign in",style: TextStyle(color: Colors.white,fontSize: 20),))),
                ],
              ),
            ),
            //Container(height: 37,child: Align(alignment: Alignment.bottomCenter,child: RichText(text: TextSpan(style: TextStyle(color: Colors.black87,fontSize: 20),children: [TextSpan(text: "Dont have a Account? "),TextSpan(text: "Register",style: TextStyle(color: Colors.green))])))),




          ],
        ),
      ),
    );
  }
}


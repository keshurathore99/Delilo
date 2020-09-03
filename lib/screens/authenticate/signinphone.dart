import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class SigninPhonePage extends StatefulWidget {

  @override
  _SigninPhonePageState createState() => _SigninPhonePageState();
}

class _SigninPhonePageState extends State<SigninPhonePage> {
  String currentText;
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(height: 240,child: Image.asset("assets/images/dellologo.png",)),
            Padding(
              padding: const EdgeInsets.only(bottom:20.0),
              child: Text("LOGIN",style: TextStyle(fontSize: 20),),
            ),

            Padding(
              padding: const EdgeInsets.only(bottom:15.0),
              child: Container(
                width: wid*.8,
                child: Material(
                  elevation: 5,
                  shape: StadiumBorder(),
                  child: TextFormField(
                   // key: __passwordkey,
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
            ),
            Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Container(
                height: 50,
                child: Align(
                  alignment: Alignment(.1,-1),
                  child: Container(
                    width: wid*.8,
                   // color: Color.fromRGBO(241,243,241, 1),
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom:10.0),
                          child: Text("OTP Recievied"),
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
                            //backgroundColor: Colors.blue.shade50,
                            enableActiveFill: true,
                            //errorAnimationController: errorController,
                            controller: textEditingController,
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
              alignment: Alignment(.6,-1),
              child: Text("Resend OTP",style: TextStyle(color: Colors.green),),
            ),


            FlatButton(onPressed: (){}, child: Align(alignment: Alignment(0,-1),child: Text("Or Login By Email"),)),
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
                      image: DecorationImage(image: AssetImage('assets/images/j.png'),fit: BoxFit.fitHeight),
                    ),
                    child: Align(alignment: Alignment(0.3,-.15),child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 15),)),
                  ),
                  Container(
                    width: 150,
                    height: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/images/p.png'),fit: BoxFit.fitHeight),
                    ),
                    child: Align(alignment: Alignment(0.3,-.15),child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 15),)),
                  ),
                ],
              ),
            ),
            Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 40,width:wid*.5,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/homescreen');}, child: Text("Sign in"))),

            Padding(
              padding: const EdgeInsets.fromLTRB(0,25,0,20),
              child: Container(height: 27,child: Align(alignment: Alignment.bottomCenter,child: RichText(text: TextSpan(style: TextStyle(color: Colors.black87,fontSize: 20),children: [TextSpan(text: "Already have a Account? "),TextSpan(text: "Login",style: TextStyle(color: Colors.green))])))),
            ),




          ],
        ),
      ),
    );
  }
}

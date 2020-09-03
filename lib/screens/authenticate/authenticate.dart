import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class AuthenticateScreen extends StatefulWidget {
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

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        key: key,
        // backgroundColor: Colors.grey[200],
        body: Center(
          child: Container(
            width: wid,
            
            color: Color.fromRGBO(241,243,241, 1),
            /*decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/back.png'),fit: BoxFit.fitWidth)
            ),*/
            child: Form(
              child: ListView(
           /*    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,*/
                children: [
                  Container(height: 120,child: Image.asset("assets/dellologo.png",)),

                  Container(
                    height: 240,
                    child: Align(
                      alignment: Alignment(0,-1),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            //color: Colors.,
                            width: wid*.80,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                // key: _usernamekey,
                                controller: userNameController,
                                
                                enableInteractiveSelection: true,
                                decoration: InputDecoration(

                                    border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                      child: Icon(Icons.person,size: 35,color: Colors.black.withOpacity(.75),),
                                    ),
                                    hintText: "Enter Username"
                                ),
                                validator: (value){},
                              ),
                            ),
                          ),
                          Container(
                            width: wid*.8,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                // key: _emailkey,
                                controller: emailController,
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
                          Container(
                            width: wid*.8,
                            child: Material(
                              elevation: 5,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                // key: _mobilenumberkey,
                                controller: phoneController,
                                enableInteractiveSelection: true,
                                decoration: InputDecoration(

                                    border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                      child: Icon(Icons.phone,size: 35,color: Colors.black.withOpacity(.75),),
                                    ),
                                    hintText: "Enter Phone"
                                ),
                                keyboardType: TextInputType.number,
                                validator: (value){},
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
                      alignment: Alignment(.1,-1),
                      child: Container(
                        width: wid*.8,
                        color: Color.fromRGBO(241,243,241, 1),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom:10.0),
                              child: Text("OTP Recievied"),
                            ),
                            Container(
                              
                              color: Color.fromRGBO(241,243,241, 1),
                              
                              width: 180,
                              //height: 200,
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
                  Align(
                    alignment: Alignment(.6,-1),
                    child: GestureDetector(
                      onTap: () {
                        phoneController.text = phoneController.text.trim();
                    codeSent
                        ? AuthService().signWithOTP(smsCode, verificationId)
                        : verifyPhone("+91" + phoneController.text);

                    if (verified) {
                      setState(() {
                        key.currentState.showSnackBar(SnackBar(content: Text('Phone Number Verified !'),));
                      });
                    }
                      },
                      child: codeSent
                      ? Text("Submit the OTP Code",
                          style: TextStyle(color: Colors.green))
                      : Text("Get OTP",
                          style: TextStyle(color: Colors.green))),
                      // child: Text("Send OTP",style: TextStyle(color: Colors.green),)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: wid*.8,
                        height: 45,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            // key: __passwordkey,
                            controller: passwordController,
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


                  FlatButton(onPressed: (){}, child: Align(alignment: Alignment(0,-1),child: Text("Or Register By"),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/j.png'),fit: BoxFit.fitHeight),
                        ),
                        child: Align(alignment: Alignment(0.3,-.15),child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 15),)),
                      ),
                      Container(
                        width: 150,
                        height: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/p.png'),fit: BoxFit.fitHeight),
                        ),
                        child: Align(alignment: Alignment(0.3,-.15),child: Text("Signup",style: TextStyle(color: Colors.white,fontSize: 15),)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 40,width:wid*.5,
                      child: FlatButton(
                        onPressed: (){
                          if (canRegister == true) {
                            Navigator.pushNamed(context, '/getlocation');
                          }else{
                            key.currentState.showSnackBar(SnackBar(content: Text('Something went wrong !'),));
                          }
                        },
                         child: Text("Register", style: TextStyle(color: Colors.white, fontSize: 18.0)))),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:18.0),
                    child: Container(height: 27,child: Align(alignment: Alignment.bottomCenter,child: RichText(text: TextSpan(style: TextStyle(color: Colors.black87, fontSize: 16.0),children: [TextSpan(text: "Already have a Account? "),TextSpan(text: "Login",style: TextStyle(color: Colors.green))])))),
                  ),




                ],
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
      FirebaseAuth.instance.signInWithCredential(authResult).then((usser) async {
        if (emailController != null &&
            phoneController != null &&
            userNameController != null &&
            passwordController != null) {
          canRegister = true;
        }
        await FirebaseAuth.instance.currentUser().then((value) {
          user = value;
        });
        await Firestore.instance
            .collection('users')
            .document(usser.user.uid)
            .setData({
              "email": emailController.text,
              "phone": phoneController.text,
              "username": userNameController.text,
              'password': passwordController.text,
         });
      });
      setState(() async {
        this.verified = true;
        this.loginKey = authResult;
        otpController.text = smsCode;
      });
    };

    final PhoneVerificationFailed verificationfailed =
        (AuthException authException) {
      print('${authException.message}'  + '***************************************');

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

import 'package:delilo/constants/decoration_constants.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/seller/authenticate/sellersignin.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SellerRegisterScreen extends StatefulWidget {
  static const routeName = '/sellerRegisterPage';

  @override
  _SellerRegisterScreenState createState() => _SellerRegisterScreenState();
}

class _SellerRegisterScreenState extends State<SellerRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: wid,
            color: Color.fromRGBO(241, 243, 241, 1),
            /*decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/back.png'),fit: BoxFit.fitWidth)
            ),*/
            child: Form(
              child: ListView(
                /*    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,*/
                children: [
                  Container(
                      height: 120,
                      child: Image.asset(
                        "assets/images/dellologo.png",
                      )),
                  Container(
                    height: 200,
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
                                enableInteractiveSelection: true,
                                decoration:
                                    registerTextFieldDecoration.copyWith(
                                        hintText: 'Username',
                                        prefixIcon: Icon(
                                          Icons.person,
                                          color: Colors.black45,
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
                                enableInteractiveSelection: true,
                                decoration:
                                    registerTextFieldDecoration.copyWith(
                                        hintText: 'Email',
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Colors.black45,
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
                                enableInteractiveSelection: true,
                                decoration:
                                    registerTextFieldDecoration.copyWith(
                                        hintText: 'Phone',
                                        prefixIcon: Icon(
                                          Icons.phone,
                                          color: Colors.black45,
                                        )),
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
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text("OTP Received"),
                            ),
                            Container(
                              color: Color.fromRGBO(241, 243, 241, 1),
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
                                backgroundColor: Colors.transparent,
                                enableActiveFill: true,
                                onChanged: (String value) {},
                                //errorAnimationController: errorController,
                              ),
                            ),
                          ],
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.all(12),
                            height: 5 * 20.0,
                            width: wid * .8,
                            child: Material(
                              elevation: 1,
                              shape: StadiumBorder(),
                              child: TextFormField(
                                enableInteractiveSelection: true,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(width: 1),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide(width: 4),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    hintText: "Type Your Address..."),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        //color: Colors.,
                        width: wid * .80,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            enableInteractiveSelection: true,
                            decoration: registerTextFieldDecoration.copyWith(
                                hintText:
                                    "Attach ID (in Backend implementation)",
                                prefixIcon: Icon(Icons.attach_file)),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            height: 50,
                            width: wid * .7,
                            child: FlatButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, '/getgstdetails');
                                },
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                ))),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SellerSigninScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black87, fontSize: 20),
                              children: [
                                TextSpan(text: "Already Have an Account? "),
                                TextSpan(
                                    text: "Login",
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

class GetGstDetails extends StatefulWidget {
  @override
  _GetGstDetailsState createState() => _GetGstDetailsState();
}

enum GstOption { have, gstexempt, willapply }

class _GetGstDetailsState extends State<GetGstDetails> {
  GstOption selected = GstOption.have;
  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                    height: 120,
                    child: Image.asset(
                      "assets/images/dellologo.png",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Give Your Business Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.grey[100].withOpacity(.6),
                    height: 40,
                    width: wid * .6,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: GstOption.have,
                          groupValue: selected,
                          onChanged: (GstOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "  I Have A GSTIN                          ",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 40,
                    width: wid * .6,
                    color: Colors.grey[100].withOpacity(.6),
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: GstOption.gstexempt,
                          groupValue: selected,
                          onChanged: (GstOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Will Only Sell In GST Exempt Categories",
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.grey[100].withOpacity(.6),
                    height: 40,
                    width: wid * .6,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: GstOption.willapply,
                          groupValue: selected,
                          onChanged: (GstOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Have Applied/Will Apply for GSTIN",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: wid * .75,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          //key: _mobilenumberkey,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              /*prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                child: Icon(Icons.phone,size: 35,color: Colors.black.withOpacity(.75),),
                              ),*/
                              hintText: "Verify GSTIN"),
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
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
                        height: 50,
                        width: wid * .7,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/getbankdetails');
                            },
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum BankOption { havesamenamebank, donthavesamename }

class GetBankDetails extends StatefulWidget {
  @override
  _GetBankDetailsState createState() => _GetBankDetailsState();
}

class _GetBankDetailsState extends State<GetBankDetails> {
  BankOption selected = BankOption.donthavesamename;
  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                    height: 120,
                    child: Image.asset(
                      "assets/images/dellologo.png",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Give Your Business Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.grey[100].withOpacity(.6),
                    height: 40,
                    width: wid * .6,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: BankOption.donthavesamename,
                          groupValue: selected,
                          onChanged: (BankOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Have A Bank Account In\n My Registered Business Name",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 40,
                    width: wid * .6,
                    color: Colors.grey[100].withOpacity(.6),
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: BankOption.havesamenamebank,
                          groupValue: selected,
                          onChanged: (BankOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Will/Have Apply for bank account in\n name of registered businees ",
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: wid * .75,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          //key: _mobilenumberkey,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              /*prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                child: Icon(Icons.phone,size: 35,color: Colors.black.withOpacity(.75),),
                              ),*/
                              hintText: "Enter Account Holder's Name"),
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: wid * .75,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          //key: _mobilenumberkey,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              /*prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                child: Icon(Icons.phone,size: 35,color: Colors.black.withOpacity(.75),),
                              ),*/
                              hintText: "Enter Bank Account Number"),
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: wid * .75,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          //key: _mobilenumberkey,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              /*prefixIcon: Padding(
                                padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                child: Icon(Icons.phone,size: 35,color: Colors.black.withOpacity(.75),),
                              ),*/
                              hintText: "Enter IFSC"),
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Dont Know GST",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: wid * .7,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/getsign');
                            },
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum SignOption { upload, signhere }

class CollectSignPage extends StatefulWidget {
  @override
  _CollectSignPageState createState() => _CollectSignPageState();
}

class _CollectSignPageState extends State<CollectSignPage> {
  SignOption selected = SignOption.signhere;
  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                    height: 120,
                    child: Image.asset(
                      "assets/images/dellologo.png",
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  "Give Your Business Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    color: Colors.grey[100].withOpacity(.6),
                    height: 40,
                    width: wid * .6,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: SignOption.signhere,
                          groupValue: selected,
                          onChanged: (SignOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Want To Draw Sign On Screen",
                          style: TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 40,
                    width: wid * .6,
                    color: Colors.grey[100].withOpacity(.6),
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //Icon(Icons.payment,size: 40,),
                        Radio(
                          value: SignOption.upload,
                          groupValue: selected,
                          onChanged: (SignOption value) {
                            setState(() {
                              selected = value;
                            });
                          },
                        ),
                        Text(
                          "I Want To Upload Sign. ",
                          style: TextStyle(
                              fontSize: 14, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 0,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 24.0,
                width: wid * .8,
                child: Material(
                  elevation: 1,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 4),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        hintText: "Click here To sign"),
                    validator: (value) {},
                  ),
                ),
              ),
              Align(
                alignment: Alignment(.9, -1),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "SKIP",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: wid * .7,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/verificationpage');
                            },
                            child: Text(
                              "Continue",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ))),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SellerVerificationPage extends StatefulWidget {
  @override
  _SellerVerificationPageState createState() => _SellerVerificationPageState();
}

class _SellerVerificationPageState extends State<SellerVerificationPage> {
  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Container(
                      height: 120,
                      child: Image.asset(
                        "assets/images/dellologo.png",
                      )),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 300,
                    width: width * .9,
                    //color: Colors.redAccent.withOpacity(.6),
                    //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
                    child: Text(
                        "\n\n\nEMAIL VERIFICATION\n\n\nWe Have Sent A Email With Subject Line (Dellilo MarketPlace)-Email Verification To Your Registered Email Adreess\nPlease Open The Email And Click On The Verification Link\n\nThe Verification link expires in 24 hours.If Its Is expired Please Click her to send again"),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  //child: Text("Address",style: TextStyle(color: Colors.green,fontSize: 25),),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    height: 180,
                    width: width * .9,
                    //color: Colors.redAccent.withOpacity(.6),
                    //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // CircleAvatar(backgroundColor: Colors.transparent,child: Image.asset("assets/images/u.png")),
                        //Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/homescreen');}, child: Text("Change",style: TextStyle(color: Colors.white,fontSize: 12),))),
                        Padding(
                          padding: const EdgeInsets.only(right: 38.0),
                          child: Text(
                              "Tracking CArd\n\nOnly Possible To Implement With The Backend.\n Will be implemented with backend"),
                        )
                      ],
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

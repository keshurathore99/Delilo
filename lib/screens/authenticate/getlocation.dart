import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:flutter/material.dart';

class GetLocationPage extends StatelessWidget {
  static const routeName = '/getLocationPage';

  @override
  Widget build(BuildContext context) {
    double wid = displayWidth(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                  height: 300,
                  child: Image.asset(
                    "assets/images/dellologo.png",
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Container(
                      height: 40,
                      width: wid * .8,
                      //color: Colors.white.withOpacity(1),
                      child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  'assets/1.png',
                                  scale: .1,
                                ),
                              ),
                              FittedBox(
                                  child: FlatButton(
                                      padding: EdgeInsets.all(0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20)),
                                      onPressed: () {},
                                      child: Text(
                                        "Click here to get location automatically",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic),
                                      ))),
                            ],
                          )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                    width: 200,
                    child: Stack(children: [
                      Divider(
                        thickness: 3,
                        color: Colors.white,
                      ),
                      Center(
                          child: Text(
                            "Or",
                            style: TextStyle(fontSize: 20),
                          )),
                    ])),
              ),
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                margin: EdgeInsets.symmetric(horizontal: wid / 15),
                child: TextFormField(
                  //key: __passwordkey,
                  enableInteractiveSelection: true,
                  maxLines: 5,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(25)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(25)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(width: 0),
                          borderRadius: BorderRadius.circular(25)),
                      hintText: "Type Your Address..."),
                  validator: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 50,
                    width: wid * .8,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/signin');
                        },
                        child: Text(
                          "Sign up",
                          style: TextStyle(color: Colors.white),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class GetLocationPage extends StatelessWidget {
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
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'assets/images/1.png',
                              scale: .1,
                            ),
                          ),
                          FittedBox(
                              child: FlatButton.icon(
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Colors.green,
                                  ),
                                  onPressed: () {},
                                  label: Text(
                                    "Click here to get location automatically",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic),
                                  ))),
                        ],
                      )),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
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
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 24.0,
                width: wid * .8,
                child: Material(
                  elevation: 5,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(width: 0),
                        ),
                        hintText: "Type Your Address..."),
                    validator: (value) {},
                  ),
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

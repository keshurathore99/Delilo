import 'package:delilo/screens/auxillary/drawer.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("Orders"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: Container(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Arriving Soon"),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    width: width * .9,
                    height: width * .25,
                    //color: Colors.black87.withOpacity(.85),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/u.png',
                            width: width * .17,
                            height: width * .19,
                            color: Colors.black87,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //direction: Axis.vertical,

                            children: [
                              Text(
                                "item Name",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: width * .03),
                              ),
                              Text(
                                "Cash on deliver",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: width * .03),
                              ),
                              Text(
                                "Price:400",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: width * .03),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(onPressed: (){}, child: Text("Cancel Order",)),
                              Container(
                                  height: width * .07,
                                  width: width * .25,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Track",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * .032),
                                    ),
                                    color: Colors.green,
                                  ))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Past Orders"),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Container(
                    width: width * .9,
                    height: width * .25,
                    //color: Colors.black87.withOpacity(.85),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/images/u.png',
                            width: width * .17,
                            height: width * .19,
                            color: Colors.black87,
                          ),
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            //direction: Axis.vertical,

                            children: [
                              Text(
                                " Name",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: width * .03),
                              ),
                              Text(
                                "Cash on deliver",
                                style: TextStyle(
                                    color: Colors.black87, fontSize: width * .03),
                              ),
                              Text(
                                "Total Amount",
                                style: TextStyle(
                                    color: Colors.green, fontSize: width * .05),
                              ),
                            ],
                          ),
                          /*Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              FlatButton(onPressed: (){}, child: Text("Cancel Order",)),
                              Container(
                                  height: width * .07,
                                  width: width * .25,
                                  child: RaisedButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Track",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width * .032),
                                    ),
                                    color: Colors.green,
                                  ))
                            ],
                          ),*/
                        ],
                      ),
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

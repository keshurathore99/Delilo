import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.green,
            child: DrawerHeader(child: Center(
              child: Container(
                color: Colors.green,
                child: Column(
                  children: [
                    Align(alignment: Alignment(-1,-1),child: Icon(Icons.close)),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(60,0,0,0),
                      child: Center(
                        //alignment: Alignment(1,1),
                        child: Row(
                          children: [
                            Icon(Icons.person_pin,size: 70,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text("Name"),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(10,15,0,0),
                                  child: Text("Gold Member"),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:20.0),
                      child: Align(alignment: Alignment(1,1),child: Text("Rate Us")),
                    ),
                  ],
                ),
              ),
            )),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Mobiles",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/fashionmain');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Fashion",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Household",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Beauty And Health",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Toys & Baby Products",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Nearby Markets",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Dairy Products",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Sport & More",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Party & Gatherings",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Travel & Explore",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/orders');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Orders",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "History",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Coupons",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Be A Seller",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/');},
            child: ListTile(
              onLongPress: null,
              title: Container(
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Padding(
                      padding: const EdgeInsets.only(left:12.0),
                      child: Text(
                        "Customer Support",
                        style: TextStyle(
                          //fontSize: 15,
                            color: Colors.green),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ),





        ],
      ),
    );
  }
}


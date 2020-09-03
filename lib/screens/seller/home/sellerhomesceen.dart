import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class SellerHomeScreen extends StatefulWidget {
  @override
  _SellerHomeScreenState createState() => _SellerHomeScreenState();
}

class _SellerHomeScreenState extends State<SellerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return Scaffold(
      drawer: SellerDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title:Text("MENU",style: TextStyle(color: Colors.black),),
        leading: Builder(
            builder: (context){
              return GestureDetector(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset('assets/images/u.png'),
              );
            }
        ),
      ),
      body: Center(
        child: Container(
          width: wid*.95,
          child: ListView(
            children: [
              Text("Tester Alert:Design has been updated for Seller Flow from previous PDF document \n The Design implemented is the new & Aceepted design",style: TextStyle(color: Colors.red),),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(decoration: BoxDecoration(color: Colors.green.withOpacity(.5),borderRadius: BorderRadius.all(Radius.circular(30))),height: 35,width:wid*.25,child: FlatButton(onPressed: (){/*Navigator.pushNamed(context, '/sellerhome');*/}, child: Text("All Items",style: TextStyle(color: Colors.white,fontSize: 12),))),
                  Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))),height: 35,width:wid*.25,child: FlatButton(onPressed: (){Navigator.pushNamedAndRemoveUntil(context, '/outofstock',(route)=>false);}, child: Text("Out Of Stock",style: TextStyle(color: Colors.grey,fontSize: 12),))),

                ],
              ),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/categorylisting');},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Container(
                    height: 100,
                   // color: Colors.redAccent.withOpacity(.6),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Fashion",style: TextStyle(color: Colors.green),),
                            Text("122 Items"),
                          ],
                        ),
                        Align(alignment: Alignment(1,-.8),child: Text("EDIT")),
                      ],
                    )),

                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/categorylisting');},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Container(
                    height: 100,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Category 2",style: TextStyle(color: Colors.green),),
                            Text("90 Items"),
                          ],
                        ),
                        Align(alignment: Alignment(1,-.8),child: Text("EDIT")),
                      ],
                    )),

                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/categorylisting');},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Container(
                    height: 100,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Category 3",style: TextStyle(color: Colors.green),),
                            Text("50 Items"),
                          ],
                        ),
                        Align(alignment: Alignment(1,-.8),child: Text("EDIT")),
                      ],
                    )),

                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),

              GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/categorylisting');},
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Container(
                    height: 100,
                    // color: Colors.redAccent.withOpacity(.6),
                    child: Center(child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text("Category 4",style: TextStyle(color: Colors.green),),
                            Text("20 Items"),
                          ],
                        ),
                        Align(alignment: Alignment(1,-.8),child: Text("EDIT")),
                      ],
                    )),

                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(decoration: BoxDecoration(color: Colors.green[700],borderRadius: BorderRadius.all(Radius.circular(30))),height: 55,width:wid*.75,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/addproductpage');}, child: Text("Add New",style: TextStyle(color: Colors.white,fontSize: 20),))),
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


class OutOfStock extends StatefulWidget {
  @override
  _OutOfStockState createState() => _OutOfStockState();
}

class _OutOfStockState extends State<OutOfStock> {
  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return Scaffold(
      drawer: SellerDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,

        title:Text("Menu",style: TextStyle(color: Colors.black),),
        leading: Builder(
            builder: (context){
              return GestureDetector(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: Image.asset('assets/images/u.png'),
              );
            }
        ),
      ),
      body: Center(
        child: Container(
          width: wid*.95,
          child: ListView(
            children: [
              Text("Design has been updated for Seller Flow from previous PDF document \n The Design implemented is the new & Aceepted design",style: TextStyle(color: Colors.red),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(decoration: BoxDecoration(color: Colors.grey[200].withOpacity(.5),borderRadius: BorderRadius.all(Radius.circular(30))),height: 35,width:wid*.25,child: FlatButton(onPressed: (){Navigator.pushNamedAndRemoveUntil(context, '/sellerhome', (route) => false);}, child: Text("All Items",style: TextStyle(color: Colors.black,fontSize: 12),))),
                  Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 35,width:wid*.25,child: FlatButton(onPressed: (){/*Navigator.pushNamed(context, '/sellerhome');*/}, child: Text("Out Of Stock",style: TextStyle(color: Colors.white,fontSize: 12),))),

                ],
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Container(
                  height: 100,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/Union1.png'),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Item 1",style: TextStyle(color: Colors.green),),
                          // Text("122 Items"),
                        ],
                      ),
                      Align(alignment: Alignment(1,-.8),child: Text("EDIT")),
                    ],
                  )),

                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Container(
                  height: 100,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/Union1.png'),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Item 2",style: TextStyle(color: Colors.green),),
                          //Text("90 Items"),
                        ],
                      ),
                      Align(alignment: Alignment(1,-.8),child: Text("EDIT")),
                    ],
                  )),

                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Container(
                  height: 100,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/Union1.png'),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("Item 3",style: TextStyle(color: Colors.green),),
                          // Text("50 Items"),
                        ],
                      ),
                      Align(alignment: Alignment(1,-.8),child: Text("EDIT")),
                    ],
                  )),

                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Container(
                  height: 100,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset('assets/images/Union1.png'),

                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [

                          Text("Item 4",style: TextStyle(color: Colors.green),),
                          //Text("20 Items"),
                        ],
                      ),
                      Align(alignment: Alignment(1,-.8),child: Text("EDIT")),
                    ],
                  )),

                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
              /* Padding(
                padding: const EdgeInsets.only(top:58.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(decoration: BoxDecoration(color: Colors.green[700],borderRadius: BorderRadius.all(Radius.circular(30))),height: 55,width:wid*.75,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/sellerhome');}, child: Text("Add New",style: TextStyle(color: Colors.white,fontSize: 20),))),
                  ],
                ),
              ),*/

            ],
          ),
        ),
      ),
    );
  }
}


import 'package:delilo/screens/auxillary/drawer.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';



class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _index=0;

  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          leading: Builder(
              builder: (context){
                return GestureDetector(
                  onTap: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child: Image.asset('assets/images/u.png'),
                );
              }
          ),//GestureDetector(child: Image.asset('assets/images/u.png'),onTap: (){Scaffold.of(context).openDrawer();},),
          centerTitle: true,
          title: Container(height:100,width: 140,child: Image.asset('assets/images/dellologo.png')),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Icon(Icons.notifications,color: Colors.green,size: 35,),
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: width*.8,
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
                              child: Icon(Icons.search,size: 35,color: Colors.green.withOpacity(.75),),
                            ),
                            hintText: "Search fro Products, Shops"
                        ),
                        validator: (value){},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 100,
              height: 200,
              child:PageView.builder(
                itemCount: 4,
                controller: PageController(viewportFraction: 0.7),
                onPageChanged: (int index) => setState(() => _index = index),
                itemBuilder: (_, i) {
                  return Transform.scale(
                    scale: i == _index ? 1 : 0.9,
                    child: Card(
                      elevation: 6,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Container(
                       /* decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage())
                        ),*/
                        child: Center(
                          child: Image.asset('assets/images/supersale.png'),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                width: width * .9,
                height: width * .27,
                //color: Colors.black87.withOpacity(.85),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        "assets/images/Union1.png",

                        //color: Colors.black87,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //direction: Axis.vertical,

                        children: [
                          Text(
                            "Shop Name",
                            style: TextStyle(color: Colors.black87, fontSize: width * .03),
                          ),
                          Text(
                            "Laptops",
                            style: TextStyle(color: Colors.black87, fontSize: width * .03),
                          ),
                          Text(
                            "1 KM away from your location ",
                            style: TextStyle(color: Colors.black87, fontSize: width * .03),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment(1,-.7),
                        child: Row(
                          children: [
                            Text("4.5"),
                            Icon(Icons.star,color: Colors.yellow,),
                          ],
                        ),
                      )

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
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                width: width * .9,
                height: width * .27,
                //color: Colors.black87.withOpacity(.85),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        "assets/images/Union1.png",

                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //direction: Axis.vertical,

                        children: [
                          Text(
                            "Shop Name",
                            style: TextStyle(color: Colors.black87, fontSize: width * .03),
                          ),
                          Text(
                            "Electric Product",
                            style: TextStyle(color: Colors.green, fontSize: width * .03),
                          ),
                          Text(
                            "1 KM away from your location ",
                            style: TextStyle(color: Colors.black87, fontSize: width * .03),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment(1,-.7),
                        child: Row(
                          children: [
                            Text("4.5"),
                            Icon(Icons.star,color: Colors.yellow,),
                          ],
                        ),
                      )

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
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                width: width * .9,
                height: width * .27,
                //color: Colors.black87.withOpacity(.85),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        "assets/images/Union1.png",
                        width: width * .09,
                        height: width * .09,
                        color: Colors.black87,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //direction: Axis.vertical,

                        children: [
                          Text(
                            "Shop Name",
                            style: TextStyle(color: Colors.black87, fontSize: width * .03),
                          ),
                          Text(
                            "Cloth",
                            style: TextStyle(color: Colors.green, fontSize: width * .03),
                          ),
                          Text(
                            "1 KM away from your location ",
                            style: TextStyle(color: Colors.black87, fontSize: width * .03),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment(1,-.7),
                        child: Row(
                          children: [
                            Text("4.5"),
                            Icon(Icons.star,color: Colors.yellow,),
                          ],
                        ),
                      )

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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.green,
          selectedItemColor: Colors.white,

          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Container(
                height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(28))
                  ),
                  child: Icon(Icons.home,color: Colors.green,)),
              title: Container(),

            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/cart');},
                child: Container(
                    height: 50,
                    width: 50,
                    /*decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),*/
                    child: Icon(Icons.shopping_cart,color: Colors.white,)),
              ),
              title: Container(),

            ),
            BottomNavigationBarItem(
              icon: GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/accountinfo');},
                child: Container(
                    height: 50,
                    width: 50,
                   /* decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),*/
                    child: Icon(Icons.person,color: Colors.white,)),
              ),
              title: Container(),

            ),
          ],
        )

    );

  }
}

import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      appBar: AppBar(
        leading:GestureDetector(child:  Icon(Icons.arrow_back_ios,color: Colors.green,),onTap: (){Navigator.pop(context);},),
        title: Text("My Cart",style: TextStyle(color: Colors.black,fontSize: 25),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              ProductCard(
                productid: 1,
                price: 400,
                name: "product 1",
                imageurl: "dd",
              ),
              ProductCard(
                productid: 1,
                price: 500,
                name: "product 2",
                imageurl: "dd",
              ),
              ProductCard(
                productid: 1,
                price: 600,
                name: "product 3",
                imageurl: "dd",
              ),
            ],
          ),
        ),
      ),
      /*bottomNavigationBar: Container(
        height: width*.4,
        width: width*.9,
        child: BottomNavigationBar(
          //backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,

          items: <BottomNavigationBarItem>[

           BottomNavigationBarItem(
              icon: Container(), */ /*Container(
                  height: 50,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  child: Container(
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))),*/ /*
              title: Container(),
            ),
            BottomNavigationBarItem(
              icon:
              title: Container(),
            ),
          ],
        ),
      ),*/
      bottomSheet: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          width: width * .95,
          height: width * .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Divider(color: Colors.brown,thickness: 2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text("Your Order"),
                  Text("RS 1500"),
                ],
              ),
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/payment');},
                child: Padding(
                  padding: const EdgeInsets.only(bottom:8.0),
                  child: Material(
                    child:          Center(child: Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(10))),height: 50,width:width*.8,child: FlatButton(child: Text("Buy Now",style: TextStyle(color: Colors.white,fontSize: 20),),onPressed: (){},))),

      ),
                ),
              ),
            ],
          ),
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
              icon: Container(
                  height: 50,
                  width: 50,
                  /*decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),*/
                  child: Icon(Icons.shopping_cart,color: Colors.white,)),
              title: Container(),

            ),
            BottomNavigationBarItem(
              icon: Container(
                  height: 50,
                  width: 50,
                  /* decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))
                  ),*/
                  child: Icon(Icons.person,color: Colors.white,)),
              title: Container(),

            ),
          ],
        )
    );
  }
}

class ProductCard extends StatefulWidget {
  final String name;

  //final String description;
  final int price;
  int productid;
  final String imageurl;

  //final String category;
  ProductCard({this.price, this.productid, this.name, this.imageurl});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Container(
        width: width * .7,
        height: width * .25,
        //color: Colors.black87.withOpacity(.85),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                height: width * .4,
                width: width * .34,
                child: Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.all(10),
                  child: Image.asset(
                    'assets/images/3.png',
                    height: width * .23,
                    width: width * .28,
                    fit: BoxFit.cover,
                  ),

                  /*child: Image.network(
                    widget.imageurl,
                    width: width * .12,
                    height: width * .12,
                    fit: BoxFit.cover,
                    //color: Colors.black87,
                  ),*/
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //direction: Axis.vertical,

                children: [
                  Text(
                    widget.name.toUpperCase(),
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
                  Text(
                    "Shop Name",
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.productid = widget.productid - 1;
                              });
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              radius: 13,
                              backgroundColor: Colors.grey[300],
                            )),
                      ),
                      Text(widget.productid.toString()),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.productid = widget.productid + 1;
                              });
                            },
                            child: CircleAvatar(
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              radius: 13,
                              backgroundColor: Colors.grey[300],
                            )),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: Align(
                  alignment: Alignment(-1, -.8),
                  child: Text(
                    "Price: Rs ${widget.price.toString()}",
                    style:
                        TextStyle(color: Colors.black87, fontSize: width * .04),
                  ),
                ),
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
    );
  }
}

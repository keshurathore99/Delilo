import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

enum PaymentMode { cod,paytm,card,gpay,upi }


class _PaymentPageState extends State<PaymentPage> {
  PaymentMode selected=PaymentMode.cod;
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment"),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child:Container(
                 height:80,
                 // color: Colors.redAccent.withOpacity(.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.payment,size: 40,),
                      Text("Credit Card or Debit Card",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                      Radio(
                        value: PaymentMode.card,
                        groupValue: selected,
                        onChanged: (PaymentMode value) {
                          setState(() {
                            selected = value;
                          });
                        },
                      ),
                    ],
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
                child:Container(
                 height:80,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.payment,size: 40,),
                      Text("UPI",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                      Radio(
                        value: PaymentMode.upi,
                        groupValue: selected,
                        onChanged: (PaymentMode value) {
                          setState(() {
                            selected = value;
                          });
                        },
                      ),
                    ],
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
                child:Container(
                 height:80,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.payment,size: 40,),
                      Text("PayTM",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                      Radio(
                        value: PaymentMode.paytm,
                        groupValue: selected,
                        onChanged: (PaymentMode value) {
                          setState(() {
                            selected = value;
                          });
                        },
                      ),
                    ],
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
                child:Container(
                 height:80,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.payment,size: 40,),
                      Text("Google Pay",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                      Radio(
                        value: PaymentMode.gpay,
                        groupValue: selected,
                        onChanged: (PaymentMode value) {
                          setState(() {
                            selected = value;
                          });
                        },
                      ),
                    ],
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
                child:Container(
                 height:80,
                  // color: Colors.redAccent.withOpacity(.6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.payment,size: 40,),
                      Text("Cash On Delivery",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),),
                      Radio(
                        value: PaymentMode.cod,
                        groupValue: selected,
                        onChanged: (PaymentMode value) {
                          setState(() {
                            selected = value;
                          });
                        },
                      ),
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

      bottomSheet: Container(
        height: 80,
        color: Colors.green[700],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text("Pay RS 480",style: TextStyle(color: Colors.white,fontSize: 20),),
            Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                ),
                child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))),height: 50,width:width*.8,child: FlatButton(onPressed:  (){Navigator.pushNamed(context, '/adressconfirm');}, child: Text("Pay Now",style: TextStyle(color: Colors.green,fontSize: 17),))),
                ),

      ],
        ),
      ),
    );

  }
}
//Container(color: Colors.white,child: Center(child: Text("Buy Now",style: TextStyle(color: Colors.green,fontSize: 18),),))


class AdressPage extends StatefulWidget {
  @override
  _AdressPageState createState() => _AdressPageState();
}

class _AdressPageState extends State<AdressPage> {
  @override
  Widget build(BuildContext context) {
    double hit = displayHeight(context);
    double wid = displayWidth(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green[700],
        title: Text("Cash On Delivery",style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
      body: Center(
        child: Container(
          width: wid*.8,
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 10.0,
                width: wid*.8,
                child: Material(
                  elevation: 1,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: "Full Name..."
                    ),
                    validator: (value){},
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 24.0,
                width: wid*.8,
                child: Material(
                  elevation: 1,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[80],
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: "Full Address..."
                    ),
                    validator: (value){},
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 10.0,
                width: wid*.8,
                child: Material(
                  elevation: 1,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: "PinCode"
                    ),
                    validator: (value){},
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 10.0,
                width: wid*.8,
                child: Material(
                  elevation: 1,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: "NearBy LandMark"
                    ),
                    validator: (value){},
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 10.0,
                width: wid*.8,
                child: Material(
                  elevation: 1,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: "Mobile Number"
                    ),
                    validator: (value){},
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                height: 5 * 10.0,
                width: wid*.8,
                child: Material(
                  elevation: 1,
                  shape: StadiumBorder(),
                  child: TextFormField(
                    //key: __passwordkey,
                    enableInteractiveSelection: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                        fillColor: Colors.grey[100],
                        filled: true,
                        border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                        hintText: "Alternate Mobile Number"
                    ),
                    validator: (value){},
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:45.0),
                child: Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 50,width:wid*.8,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/orderdone');}, child: Text("Confirm Order",style: TextStyle(color: Colors.white,fontSize: 20),))),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class OrderPlaced extends StatefulWidget {
  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Card(
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child:Container(
            height: 400,
            color: Colors.white.withOpacity(.6),
            child: Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(backgroundColor:Colors.green,child: Icon(Icons.check,color: Colors.white,size: 40,)),
                Text("Ordered Succesfully\n",style: TextStyle(fontSize: 30,color: Colors.green),),
                Text("Thank You So Much For \n Ordering\n\n",textAlign: TextAlign.center,style: TextStyle(fontSize: 18,color: Colors.black),),
                GestureDetector(
                 // onTap: (){Navigator.pushNamed(context, '/payment');},
                  child: Material(
                    child: Container(
                        height: 50,
                        width: width*.5,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(50))),
                        child: Container(
                            color: Colors.green[700],
                            child: Center(
                              child: Text(
                                "Check Status",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ))),
                  ),
                ),
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
      bottomSheet: Container(
        height: 85,
        child: Padding(
          padding: const EdgeInsets.only(bottom:20.0),
          child: Center(child: Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 50,width:width*.8,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/homescreen');}, child: Text("Continue Shopping",style: TextStyle(color: Colors.white,fontSize: 20),)))),
        ),
      ),

    );
  }
}




import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class SellerOrdersPage extends StatefulWidget {
  @override
  _SellerOrdersPageState createState() => _SellerOrdersPageState();
}

class _SellerOrdersPageState extends State<SellerOrdersPage> {
  int isselected=1;
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (context){
              return GestureDetector(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.arrow_back,color: Colors.green,),
              );
            }
        ),
        title: Text("Acepting Orders",style: TextStyle(color: Colors.green),),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){setState(() {
                    isselected=1;
                  });},
                  child: Container(
                    width: 60,
                    height: 40,
                    child: Center(child: Text("All")),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.2,color: (isselected==1)?Colors.green:Colors.transparent)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){setState(() {
                    isselected=2;
                  });},
                  child: Container(
                    width: 60,
                    height: 40,
                    child: Center(child: Text("Packing")),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.2,color: (isselected==2)?Colors.green:Colors.transparent)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){setState(() {
                    isselected=3;
                  });},
                  child: Container(
                    width: 60,
                    height: 40,
                    child: Center(child: Text("Ready")),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.2,color: (isselected==3)?Colors.green:Colors.transparent)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){setState(() {
                    isselected=4;
                  });},
                  child: Container(
                    width: 60,
                    height: 40,
                    child: Center(child: Text("Picked")),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.2,color: (isselected==4)?Colors.green:Colors.transparent)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){setState(() {
                    isselected=5;
                  });},
                  child: Container(
                    width: 60,
                    height: 40,
                    child: Center(child: Text("Shipping")),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.2,color: (isselected==5)?Colors.green:Colors.transparent)),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){setState(() {
                    isselected=6;
                  });},
                  child: Container(
                    width: 60,
                    height: 40,
                    child: Center(child: Text("Delivered")),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.2,color: (isselected==6)?Colors.green:Colors.transparent)),
                    ),
                  ),
                ),

              ],
            ),
        ),
      ),
      body: Builder(builder: (BuildContext context){
        switch(isselected){
          case 1 :return Center(child: ListView(children: [SellerOrdersCard(),SellerOrdersCard(),SellerOrdersCard(),SellerOrdersCard()]),);
          case 2 :return Center(child: ListView(children: [SellerOrdersCard()]),);
          case 3 :return Center(child: ListView(children: [SellerOrdersCard(),SellerOrdersCard(),SellerOrdersCard(),SellerOrdersCard(),SellerOrdersCard(),SellerOrdersCard()]),);
          case 4 :return Center(child: ListView(children: []),);
          case 5 :return Center(child: ListView(children: [SellerOrdersCard()]),);
        }
        return Center(child: ListView(children: [SellerOrdersCard(),SellerOrdersCard()]),);
      }),

    );
  }
}

class SellerOrdersCard extends StatefulWidget {
  @override
  _SellerOrdersCardState createState() => _SellerOrdersCardState();
}

class _SellerOrdersCardState extends State<SellerOrdersCard> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child:Container(
        height: 400,
        color: Colors.grey[100].withOpacity(.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("ID: 1711111"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Status",style: TextStyle(color: Colors.green),),
                Text("Name Of Customer"),

              ],
            ),
            Text("Ordered Product Nme"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right:12.0),
                  child: Text("Rs : Amount",style: TextStyle(color: Colors.green),),
                ),
                Container(decoration: BoxDecoration(color: Colors.green[700],borderRadius: BorderRadius.all(Radius.circular(30))),height: 20,width:width*.15,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/sellerhome');}, child: Text("Paid",style: TextStyle(color: Colors.white,fontSize: 12),))),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton.icon(onPressed: (){}, icon: Icon(Icons.location_on), label: Text("Addresss")),
                Text("Mobile NUmber"),
              ],
            ),
            Container(decoration: BoxDecoration(color: Colors.green[700],borderRadius: BorderRadius.all(Radius.circular(30))),height: 35,width:width*.65,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/sellerhome');}, child: Text("Order Status (Timer)",style: TextStyle(color: Colors.white,fontSize: 15),))),



          ],
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



import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';


class SellerDrawer extends StatefulWidget {
  @override
  _SellerDrawerState createState() => _SellerDrawerState();
}

class _SellerDrawerState extends State<SellerDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            color: Colors.green,
            height: 150,
            //width: 50,
            child: DrawerHeader(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_pin,size: 60,),
                Text("Name"),

              ],
            ),),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/orderslist');},
            child: Container(
              height: 50,
              child: Center(child: Text("Order",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/sellerhome');},
            child: Container(
              height: 50,
              child: Center(child: Text("Menu",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/payin');},
            child: Container(
              height: 50,
              child: Center(child: Text("Pay In",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
          ),
          GestureDetector(
            onTap: (){Navigator.pushNamed(context, '/sellerprofile');},
            child: Container(
              height: 50,
              child: Center(child: Text("Profile",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            ),
          ),


        ],
      ),
    );
  }
}

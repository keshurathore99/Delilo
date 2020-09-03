import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';


class PayinPage extends StatefulWidget {
  @override
  _PayinPageState createState() => _PayinPageState();
}

class _PayinPageState extends State<PayinPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SellerDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
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
        title: Text("Payin",style: TextStyle(color: Colors.green),),
      ),
      body: Center(
        child: Container(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Product",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Amount",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Date",style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

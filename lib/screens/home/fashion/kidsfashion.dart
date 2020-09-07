import 'package:delilo/widgets/main_product_item.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class KidsFashionScreen extends StatefulWidget {
  @override
  _KidsFashionScreenState createState() => _KidsFashionScreenState();
}

class _KidsFashionScreenState extends State<KidsFashionScreen> {
  int _babyIndex = 0;
  int _boysIndex = 0;
  int _girlsIndex = 0;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 18.0, 0, 18),
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    Container(
                      width: width * .8,
                      child: Material(
                        elevation: 5,
                        shape: StadiumBorder(),
                        child: TextFormField(
                          // key: __passwordkey,
                          enableInteractiveSelection: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(width: 4),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Icon(
                                  Icons.search,
                                  size: 35,
                                  color: Colors.green.withOpacity(.75),
                                ),
                              ),
                              hintText: "Search for Products"),
                          validator: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Baby Clothes",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 30,
                        width: width * .2,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/womenfashiondress');
                            },
                            child: Text("More"))),
                  ],
                ),
              ),
              Container(
                width: width,
                height: displayHeight(context) / 2,
                child: PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (int index) =>
                      setState(() => _babyIndex = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                        scale: i == _babyIndex ? 1 : 0.9,
                        child: MainProductItem(
                            productName: 'Baby Cloth',
                            shopName: 'Baby Shop',
                            price: 399,
                            imageUrl:
                                'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/miniclasix-baby-three-piece-set-1528834907.jpg'));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Girl kids",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 30,
                        width: width * .2,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/womenfashiondetail');
                            },
                            child: Text("More"))),
                  ],
                ),
              ),
              Container(
                width: width,
                height: displayHeight(context) / 2,
                child: PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (int index) =>
                      setState(() => _girlsIndex = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                        scale: i == _girlsIndex ? 1 : 0.9,
                        child: MainProductItem(
                            productName: 'Girl Kids Cloths',
                            shopName: 'Girls Shop',
                            price: 299,
                            imageUrl:
                                'https://images-na.ssl-images-amazon.com/images/I/61CHLqGACJL._UL1024_.jpg'));
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      "Boy kids",
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 30,
                        width: width * .2,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, '/womenfashiondetail');
                            },
                            child: Text("More"))),
                  ],
                ),
              ),
              Container(
                width: width,
                height: displayHeight(context) / 2,
                child: PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (int index) =>
                      setState(() => _boysIndex = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                        scale: i == _boysIndex ? 1 : 0.9,
                        child: MainProductItem(
                            productName: 'Boys Cloth',
                            shopName: 'Boys T-shirt',
                            price: 129,
                            imageUrl:
                                'https://lh3.googleusercontent.com/proxy/Z34XKlOjsQ-fYXCIqBPAaYhwmgcrkk_O2ETTtr-F_47VDe9JOarflZw1vdu9aQXrP7enzgmXY-f4y2fPnGoSNMFdyrDtbQ0ECc7-QaiCv2uWO3p5_Q3jKCQdXem8v_iIcnVgm8N7NGUBPqU-dM6Ce_I-YnNmJsgTt32TG33Txbi6nLfjp_hcL-phdaMjVjQMPS_ZX0yWJU7dWiR6hdn8Ri44m-AsWCEb1CSquvpwBwAAzqRfjmg4RaLim7sNbhjH'));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

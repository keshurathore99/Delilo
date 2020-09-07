import 'package:delilo/widgets/main_product_item.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class WomenFashionScreen extends StatefulWidget {
  @override
  _WomenFashionScreenState createState() => _WomenFashionScreenState();
}

class _WomenFashionScreenState extends State<WomenFashionScreen> {
  int _dressIndex = 0;
  int _topsIndex = 0;
  int _traditionalIndex = 0;

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
                      "Dress",
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
                height: displayHeight(context) / 1.98,
                child: PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (int index) =>
                      setState(() => _dressIndex = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                        scale: _dressIndex == i ? 1 : 0.9,
                        child: MainProductItem(
                            productName: 'Dress For Woman',
                            shopName: 'Woman Shop',
                            price: 999,
                            imageUrl:
                                'https://rukminim1.flixcart.com/image/714/857/jqfinww0/dress/8/y/w/xxl-ragini-blue-reyans-original-imafcduaa5b5pghg.jpeg?q=50'));
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
                      "Tops",
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
                      setState(() => _topsIndex = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                        scale: _topsIndex == i ? 1 : 0.9,
                        child: MainProductItem(
                            productName: 'Tops For Woman',
                            shopName: 'Woman Top',
                            price: 1299,
                            imageUrl:
                                'https://rukminim1.flixcart.com/image/714/857/top/y/f/h/m-ep1602-pink-rare-original-imaeqct5fbzghe4q.jpeg?q=50'));
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
                      "Traditional",
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
                height: displayHeight(context) / 1.69,
                child: PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (int index) =>
                      setState(() => _traditionalIndex = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                        scale: _traditionalIndex == i ? 1 : 0.9,
                        child: MainProductItem(
                            productName: 'Tradition Dress For Woman',
                            shopName: 'Woman Dress Shop',
                            price: 1599,
                            imageUrl:
                                'https://ksbeautifulartandcraft.com/wp-content/uploads/2018/01/3128fcab-2e34-4174-839b-ec8a9ba83272.jpg'));
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

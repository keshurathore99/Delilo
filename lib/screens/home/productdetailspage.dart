import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/widgets/user_review.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;
  ProductDetailPage({@required this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _opacity1 = 0;
  double _opacity2 = 0;
  double _opacity3 = 0;
  double _opacity4 = 0;
  changeopacity(double opacity) {
    if (opacity == 0)
      opacity = 1;
    else
      opacity = 0;
    return opacity;
  }

  int _index = 0;
  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.green,
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 30,
                    ),
                  ))),
        ),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Container(
                  width: width,
                  height: 350,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 1),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            /* decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage())
                          ),*/
                            child: Center(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: FadeInImage(
                                    image:
                                        NetworkImage(widget.product.imageUrl),
                                    placeholder: AssetImage(
                                        'assets/fashion/fashion7.jpg'),
                                  )),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  //alignment: Alignment(.6,-1),
                  child: Text(
                    widget.product.productName,
                    style: TextStyle(color: Colors.green, fontSize: 30),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.product.shopName,
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          Container(
                            width: 250,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 19.0),
                                  child: Text(
                                    "\$${widget.product.price}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 25),
                                  ),
                                ),
                                SmoothStarRating(
                                  isReadOnly: true,
                                  rating:
                                      widget.product.ratings.toDouble() == null
                                          ? 0
                                          : widget.product.ratings.toDouble(),
                                  color: Colors.yellow,
                                  borderColor: Colors.yellow,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.green,
                          child: Center(
                            child: Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 30,
                            ),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.product.description,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Center(
                    child: Text(
                  "\nReviews",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                )),
                ...widget.product.reviews.map((review) {
                  return UserReview(
                      name: review.name,
                      rating: review.rating,
                      comment: review.reviewComment,
                      imageUrl: review.imageUrl);
                }),
              ],
            ),
          ),
        ),
        bottomNavigationBar: bottomNavigationBar(),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      height: 80,
      child: BottomNavigationBar(
        //backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,

        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    //color: Colors.green,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 50,
                    width: displayWidth(context) * .8,
                    child: FlatButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/cart');
                        },
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        )))),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
                child: Container(
                    height: 50,
                    width: 120,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        height: 50,
                        width: displayWidth(context) * .8,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/cart');
                            },
                            child: Text(
                              "Pay Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ))))),
            title: Container(),
          ),
        ],
      ),
    );
  }
}

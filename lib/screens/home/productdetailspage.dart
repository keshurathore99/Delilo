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
  int _index = 0;
  int imageCount = 0;
  String _imageToShow;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    if (widget.product.imageUrl != null) {
      imageCount++;
    }
    if (widget.product.image2 != null) {
      imageCount++;
    }
    if (widget.product.image3 != null) {
      imageCount++;
    }
    if (widget.product.image4 != null) {
      imageCount++;
    }

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
                    itemCount: imageCount,
                    controller: PageController(viewportFraction: 1),
                    itemBuilder: (_, i) {
                      if (i == 0)
                        _imageToShow = widget.product.imageUrl;
                      else if (i == 1)
                        _imageToShow = widget.product.image2;
                      else if (i == 2)
                        _imageToShow = widget.product.image3;
                      else if (i == 3) _imageToShow = widget.product.image4;

                      return Transform.scale(
                        scale: 1,
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
                                    image: NetworkImage(_imageToShow),
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                widget.product.shopName,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 25),
                                textAlign: TextAlign.left,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4),
                                child: Container(
                                  width: 250,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 19.0),
                                        child: Text(
                                          "₹${widget.product.price}",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25),
                                        ),
                                      ),
                                      SmoothStarRating(
                                        isReadOnly: true,
                                        rating: widget.product.ratings
                                                    .toDouble() ==
                                                null
                                            ? 0
                                            : widget.product.ratings.toDouble(),
                                        color: Colors.yellow,
                                        borderColor: Colors.yellow,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                  padding: const EdgeInsets.all(15.0),
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
                widget.product.reviews.length == 0
                    ? Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            'No Reviews Till Now',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    : null,
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

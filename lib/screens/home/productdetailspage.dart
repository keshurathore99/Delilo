import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/buyer%20widgets/user_review.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/screens/home/cart.dart';
import 'package:delilo/screens/home/favorite_products_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

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
      child: ModalProgressHUD(
        inAsyncCall: _loading,
        child: Scaffold(
          key: _scaffoldKey,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniStartTop,
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
                                          padding: const EdgeInsets.only(
                                              right: 19.0),
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
                                              : widget.product.ratings
                                                  .toDouble(),
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
                        InkWell(
                          onTap: () async {
                            final user =
                                await FirebaseAuth.instance.currentUser();

                            final snapshot = await Firestore.instance
                                .collection('users')
                                .document(user.uid)
                                .get();

                            if (snapshot.data['favoriteProducts'] != null) {
                              final favoriteList =
                                  snapshot.data['favoriteProducts'] as List;

                              if (widget.product.productType
                                  .contains('fashion')) {
                                final productTypeList =
                                    widget.product.productType.split(' ');

                                final mainCategory = productTypeList[0];
                                final category = productTypeList[1];
                                final subCategory = productTypeList[2];

                                favoriteList.add(
                                    '$mainCategory/$category/$subCategory/${widget.product.productId}');
                                await Firestore.instance
                                    .collection('users')
                                    .document(user.uid)
                                    .updateData(
                                        {'favoriteProducts': favoriteList});
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Added to Favorites')));
                                return;
                              } else {
                                favoriteList.add(
                                    '${widget.product.productType}/${widget.product.productId}');
                                await Firestore.instance
                                    .collection('users')
                                    .document(user.uid)
                                    .updateData(
                                        {'favoriteProducts': favoriteList});
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Added to Favorites')));
                                return;
                              }
                            } else {
                              if (widget.product.productType
                                  .contains('fashion')) {
                                final productTypeList =
                                    widget.product.productType.split(' ');

                                final mainCategory = productTypeList[0];
                                final category = productTypeList[1];
                                final subCategory = productTypeList[2];

                                final String path =
                                    '$mainCategory/$category/$subCategory/${widget.product.productId}';

                                await Firestore.instance
                                    .collection('users')
                                    .document(user.uid)
                                    .updateData({'favoriteProducts': path});
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Added to Favorites')));
                              } else {
                                await Firestore.instance
                                    .collection('users')
                                    .document(user.uid)
                                    .updateData({
                                  'favoriteProducts': [
                                    '${widget.product.productType}/${widget.product.productId}'
                                  ]
                                });
                                _scaffoldKey.currentState.showSnackBar(SnackBar(
                                    content: Text('Added to Favorites')));
                              }
                            }
                          },
                          child: CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.green,
                              child: Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              )),
                        ),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(opacity: 0, child: Text('Hello User')),
                      Text(
                        "\nReviews",
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      ),
                      IconButton(
                        padding: EdgeInsets.all(0),
                        icon: Icon(Icons.add),
                        onPressed: addReview,
                      )
                    ],
                  ),
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
                      : Container(),
                  ...widget.product.reviews.map((review) {
                    return UserReview(
                        name: review['username'],
                        rating: review['ratings'],
                        comment: review['reviewComment'],
                        imageUrl: review['imageUrl']);
                  }),
                ],
              ),
            ),
          ),
          bottomNavigationBar: bottomNavigationBar(),
        ),
      ),
    );
  }

  Widget bottomNavigationBar() {
    return Container(
      height: 80,
      child: BottomNavigationBar(
        selectedItemColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
                height: 50,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    height: 50,
                    width: displayWidth(context) * .8,
                    child: FlatButton(
                        onPressed:
                            widget.product.inStock == true ? addToCart : null,
                        child: Text(
                          widget.product.inStock == true
                              ? "Add To Cart"
                              : 'Out Of Stock',
                          style: TextStyle(color: Colors.green, fontSize: 15),
                        )))),
            title: Container(),
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
                onTap: () async {
                  final user = await FirebaseAuth.instance.currentUser();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartPage(
                                userUid: user.uid,
                              )));
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
                            onPressed: () async {
                              final user =
                                  await FirebaseAuth.instance.currentUser();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CartPage(
                                            userUid: user.uid,
                                          )));
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

  void addToCart() async {
    final user = await FirebaseAuth.instance.currentUser();
    final userUid = user.uid;

    final snapshot =
        await Firestore.instance.collection('users').document(userUid).get();
    final productList = snapshot.data['cartProducts'] as List;

    bool alreadyExistsInCart = false;

    productList.forEach((element) {
      if (element['productId'].toString().contains(widget.product.productId)) {
        print(
            element['productId'].toString() + '   ' + widget.product.productId);
        alreadyExistsInCart = true;
        return;
      }
    });

    if (alreadyExistsInCart) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content:
              Text(widget.product.productName + ' Already Exists in Cart')));
      return;
    }

    if (widget.product.productType.contains('fashion')) {
      final query = widget.product.productType.split(' ');
      final mainCategory = query[0];
      final category = query[1];
      final subCategory = query[2];

      productList.add({
        'productId':
            '$mainCategory/$category/$subCategory/${widget.product.productId}',
        'quantity': 1,
        'price': widget.product.price,
      });

      int totalCartPrice = 0;

      productList.forEach((product) {
        totalCartPrice = totalCartPrice + product['price'];
      });

      print(totalCartPrice);

      try {
        await Firestore.instance
            .collection('users')
            .document(userUid)
            .updateData({
          'cartProducts': productList,
          'totalCartPrice': totalCartPrice,
        });

        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('Added To Cart')));
        return;
      } catch (e) {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text(e.toString())));
        return;
      }
    }

    productList.add({
      'productId': '${widget.product.productType}/${widget.product.productId}',
      'quantity': 1,
      'price': widget.product.price,
    });

    int totalCartPrice = 0;

    productList.forEach((product) {
      totalCartPrice = totalCartPrice + product['price'];
    });

    try {
      await Firestore.instance.collection('users').document(userUid).updateData(
          {'cartProducts': productList, 'totalCartPrice': totalCartPrice});

      _scaffoldKey.currentState
          .showSnackBar(SnackBar(content: Text('Added To Cart')));
    } catch (e) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text('There is Some Problem in Cart Please Try Again')));
      return;
    }
  }

  void addReview() {
    double _ratings = 0.0;
    final reviewController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Add Review',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      controller: reviewController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 8),
                          hintText: 'Add a Review',
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.green),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SmoothStarRating(
                        starCount: 5,
                        size: 30,
                        borderColor: Colors.yellow,
                        color: Colors.yellow,
                        rating: _ratings,
                        onRated: (ratings) {
                          setState(() {
                            _ratings = ratings;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: displayWidth(context) * 0.20),
                      child: RaisedButton(
                        onPressed: () async {
                          if (reviewController.text.isEmpty) {
                            _scaffoldKey.currentState.showSnackBar(SnackBar(
                                content: Text(
                                    'Please Enter Your Review To Publish')));
                            return;
                          }

                          setState(() {
                            _loading = true;
                          });

                          var productSnapshot;
                          bool isFashion;
                          String fashionPath;
                          String mainPath;

                          final user =
                              await FirebaseAuth.instance.currentUser();

                          if (widget.product.productType.contains('fashion')) {
                            final path = widget.product.productType.split(' ');
                            final mainCategory = path[0];
                            final category = path[1];
                            final subCategory = path[2];

                            fashionPath =
                                '$mainCategory/$category/$subCategory/${widget.product.productId}';

                            productSnapshot = await Firestore.instance
                                .document(fashionPath)
                                .get();
                            isFashion = true;
                          } else {
                            final path = widget.product.productType.split(' ');
                            final category = path[0];

                            mainPath = '$category/${widget.product.productId}';

                            productSnapshot = await Firestore.instance
                                .document(mainPath)
                                .get();
                            isFashion = false;
                          }

                          final userSnapshot = await Firestore.instance
                              .collection('users')
                              .document(user.uid)
                              .get();

                          final reviewList =
                              productSnapshot.data['reviews'] as List;

                          final reviewComment = reviewController.text;
                          final username = userSnapshot.data['name'];
                          final imageUrl = userSnapshot.data['profilePic'];
                          final ratings = _ratings;

                          reviewList.add({
                            'reviewComment': reviewComment,
                            'username': username,
                            'imageUrl': imageUrl,
                            'ratings': ratings
                          });

                          if (isFashion == true) {
                            await Firestore.instance
                                .document(fashionPath)
                                .updateData({'reviews': reviewList});
                          } else {
                            await Firestore.instance
                                .document(mainPath)
                                .updateData({'reviews': reviewList});
                          }

                          Navigator.of(context).pop();

                          setState(() {
                            widget.product.reviews.add({
                              'reviewComment': reviewComment,
                              'username': username,
                              'imageUrl': imageUrl,
                              'ratings': ratings
                            });
                            _loading = false;
                          });

                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text('Successfully Published')));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        textColor: Colors.white,
                        color: Colors.green,
                        child: FittedBox(
                            child: Text(
                          'Publish',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}

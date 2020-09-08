import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/models/product.dart';
import 'package:delilo/models/review.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'file:///C:/Users/lenovo/Desktop/Delilo/lib/widgets/drawer.dart';
import 'package:delilo/widgets/category_for_fashion_page.dart';
import 'package:delilo/widgets/main_product_item.dart';
import 'package:delilo/widgets/second_product_item_for_fashion_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FashionMainPage extends StatefulWidget {
  static const routeName = '/fashionMainPage';

  @override
  _FashionMainPageState createState() => _FashionMainPageState();
}

class _FashionMainPageState extends State<FashionMainPage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final width = displayWidth(context);
    final height = displayHeight(context);
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 18.0, 0, 18),
                  child: Row(
                    children: [
                      Builder(builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Image.asset('assets/u.png'),
                        );
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
                                hintText: "Search fro Products, Shops"),
                            validator: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Text(
                    "FASHION",
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black87),
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.only(right: width / 1.3),
                    height: 3,
                  ),
                ),
                FutureBuilder<DocumentSnapshot>(
                    future: Firestore.instance
                        .collection('fashion')
                        .document('main_page')
                        .get(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          height: displayHeight(context) / 2,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      if (!snapshot.data.exists) {
                        return Container(
                          height: displayHeight(context) / 2,
                          child: Center(
                            child: Text('Sorry But No Dresses Found'),
                          ),
                        );
                      }

                      final refList = snapshot.data.data['ref'] as List;

//                      Firestore.instance
//                          .document(refList[0])
//                          .get()
//                          .then((value) => print(value.data));

                      return Container(
                        height: displayHeight(context) / 2,
                        width: width,
                        child: PageView.builder(
                          itemCount: refList.length,
                          controller: PageController(viewportFraction: 0.4),
//                    onPageChanged: (index) => setState(() => _index = index),
                          itemBuilder: (_, index) {
                            return FutureBuilder<DocumentSnapshot>(
                                future: Firestore.instance
                                    .document(refList[index])
                                    .get(),
                                builder: (context, smallShot) {
                                  if (smallShot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Container(
                                      height: displayHeight(context) / 2,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  return Transform.scale(
                                      scale: 1,
                                      child: MainProductItem(
                                        product: Product(
                                            imageUrl:
                                                'https://n3.sdlcdn.com/imgs/a/p/5/Karyn-Silver-Color-Party-Wear-SDL081527004-1-4d06c.jpg',
                                            productName:
                                                smallShot.data.data['name'],
                                            shopName: smallShot
                                                .data.data['shop_name'],
                                            price: int.parse(smallShot
                                                .data.data['price']
                                                .toString()),
                                            ratings: 4,
                                            colors: [Colors.black],
                                            description: smallShot.data
                                                        .data['description'] ==
                                                    null
                                                ? 'description'
                                                : smallShot
                                                    .data.data['description'],
                                            reviews: []),
                                      ));
                                });
                          },
                        ),
                      );
                    }),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    "For",
                    style: TextStyle(fontSize: 20, color: Colors.black87),
                  ),
                ),
                Row(
                  children: [
                    CategoriesForFashionPage(
                        'assets/i.png', 'Men', '/mensfashion'),
                    CategoriesForFashionPage(
                        'assets/3.png', 'Women', '/womenfashion'),
                    CategoriesForFashionPage(
                      'assets/6.png',
                      'Kids',
                      '/kidsfashion',
                      isChildren: true,
                    ),
                  ],
                ),
                Container(
                  height: 500,
                  child: FutureBuilder<DocumentSnapshot>(
                      future: Firestore.instance
                          .collection('fashion')
                          .document('main_page')
                          .get(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        final list =
                            snapshot.data.data['ref_for_second_item'] as List;

                        return GridView.count(
                            crossAxisCount: 2,
                            children: list.map((product) {
                              return FutureBuilder(
                                future:
                                    Firestore.instance.document(product).get(),
                                builder: (context, smallShot) {
                                  if (smallShot.connectionState ==
                                      ConnectionState.waiting) {
                                    return Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }
                                  print(smallShot.data['name']);
                                  return SecondProductItemForFashionScreen(Product(
                                      imageUrl:
                                          'https://n3.sdlcdn.com/imgs/a/p/5/Karyn-Silver-Color-Party-Wear-SDL081527004-1-4d06c.jpg',
                                      productName: smallShot.data['name'],
                                      shopName: smallShot.data['shop_name'],
                                      price: int.parse(smallShot.data['price']),
                                      ratings: 4.3,
                                      colors: [Colors.green],
                                      description:
                                          smallShot.data['description'],
                                      reviews: []));
                                },
                              );
                            }).toList());
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

//  [
//  SecondProductItemForFashionScreen(Product(
//  imageUrl:
//  'https://n3.sdlcdn.com/imgs/a/p/5/Karyn-Silver-Color-Party-Wear-SDL081527004-1-4d06c.jpg',
//  productName: 'Casual Wear',
//  shopName: 'Robust Shop',
//  price: 999,
//  ratings: 4.8,
//  colors: [Colors.black],
//  description: 'Hello Friends',
//  reviews: [])),
//  ],
}

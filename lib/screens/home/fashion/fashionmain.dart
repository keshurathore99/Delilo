import 'package:delilo/models/product.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'file:///C:/Users/lenovo/Desktop/Delilo/lib/widgets/drawer.dart';
import 'package:delilo/widgets/category_for_fashion_page.dart';
import 'package:delilo/widgets/main_product_item.dart';
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
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: width,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 0.4),
                    onPageChanged: (index) => setState(() => _index = index),
                    itemBuilder: (_, index) {
                      return Transform.scale(
                          scale: _index == index ? 1 : 0.9,
                          child: MainProductItem(
                            product: Product(
                                imageUrl:
                                    'https://n3.sdlcdn.com/imgs/a/p/5/Karyn-Silver-Color-Party-Wear-SDL081527004-1-4d06c.jpg',
                                productName: 'Cloth',
                                shopName: 'My Cloth Shop',
                                price: 929,
                                ratings: 4,
                                colors: [Colors.black],
                                description: 'hbedhbhed',
                                reviews: []),
                          ));
                    },
                  ),
                ),
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
//                Row(
//                  children: [
//                    Expanded(
//                      child: MainProductItem(
//                          productName: 'Salwar Suit',
//                          shopName: 'Keshav Shop',
//                          price: 927,
//                          imageUrl:
//                              'https://images.pexels.com/photos/235986/pexels-photo-235986.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//                    ),
//                    Expanded(
//                      child: MainProductItem(
//                          productName: 'Salwar Suit',
//                          shopName: 'Keshav Shop',
//                          price: 927,
//                          imageUrl:
//                              'https://images.pexels.com/photos/235986/pexels-photo-235986.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//                    ),
//                  ],
//                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

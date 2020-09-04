import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:delilo/screens/auxillary/drawer.dart';
import 'package:delilo/widgets/category_for_fashion_page.dart';
import 'package:flutter/material.dart';

class FashionMainPage extends StatefulWidget {
  static const routeName = '/fashionMainPage';

  @override
  _FashionMainPageState createState() => _FashionMainPageState();
}

class _FashionMainPageState extends State<FashionMainPage> {
  @override
  Widget build(BuildContext context) {
    final width = displayWidth(context);
    final height = displayHeight(context);
    int _index = 0;
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
                  width: width,
                  height: 200,
                  child: PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 0.6),
                    onPageChanged: (int index) =>
                        setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/productsdetail');
                          },
                          child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage('assets/Union1.png'),
                                fit: BoxFit.fitHeight,
                                alignment: Alignment.topCenter,
                              )),
                              /* decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage())
                              ),*/
                              child: FractionallySizedBox(
                                alignment: Alignment.bottomCenter,
                                heightFactor: .4,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20))),
                                  child:
                                      Center(child: Text("Some Description")),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
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
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Container(
                    height: 300,
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: [
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/Union1.png'),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.topCenter,
                            )),
                            child: FractionallySizedBox(
                              alignment: Alignment.bottomCenter,
                              heightFactor: .4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Center(child: Text("Some Description")),
                              ),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage('assets/Union1.png'),
                              fit: BoxFit.fitHeight,
                              alignment: Alignment.topCenter,
                            )),
                            /* decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage())
                            ),*/
                            child: FractionallySizedBox(
                              alignment: Alignment.bottomCenter,
                              heightFactor: .4,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20))),
                                child: Center(child: Text("Some Description")),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
/*
Card(
semanticContainer: true,
clipBehavior: Clip.antiAliasWithSaveLayer,
child: Container(
height: 200,
width: width*.22,
child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .3,child: Container(color: Colors.white,child: Center(child: Text("Some Description")),),),
decoration: BoxDecoration(
image: DecorationImage(
colorFilter: ColorFilter.mode(Colors.black87.withOpacity(.2), BlendMode.darken),
image: AssetImage('assets/images/fashion1.jpg'),

fit: BoxFit.fitHeight,
alignment: Alignment.topCenter,
),
),
),


shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(10.0),
),
elevation: 5,
margin: EdgeInsets.all(10),
),*/

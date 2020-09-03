import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';


class ProductDetailPage extends StatefulWidget {
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  double _opacity1=0;
  double _opacity2=0;
  double _opacity3=0;
  double _opacity4=0;
  changeopacity(double opacity){
    if(opacity==0)opacity=1;
    else opacity=0;
    return opacity;
  }
  int _index=0;
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        //extendBodyBehindAppBar: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top:80.0),
          child: GestureDetector(onTap: (){Navigator.pop(context);},child: CircleAvatar(radius: 20,backgroundColor: Colors.green,child: Center(child: Icon(Icons.arrow_back_ios,color: Colors.white,size: 30,),))),
             ),
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Container(
                  width: width,
                  height: 350,
                  child:PageView.builder(
                    itemCount: 4,
                    controller: PageController(viewportFraction: 1),
                    onPageChanged: (int index) => setState(() => _index = index),
                    itemBuilder: (_, i) {
                      return Transform.scale(
                        scale: i == _index ? 1 : 0.9,
                        child: Card(
                          elevation: 6,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            /* decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage())
                          ),*/
                            child: Center(
                              child: Image.asset('assets/images/supersale.png'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  //alignment: Alignment(.6,-1),
                  child: Text("Product Name",style: TextStyle(color: Colors.green,fontSize: 30),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("Shop Name",style: TextStyle(color: Colors.black,fontSize: 25),),
                          Container(
                            width: 250,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right:19.0),
                                  child: Text("\$1500",style: TextStyle(color: Colors.black,fontSize: 25),),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star,color: Colors.yellow,),
                                    Icon(Icons.star,color: Colors.yellow,),
                                    Icon(Icons.star,color: Colors.yellow,),
                                    Icon(Icons.star_border,color: Colors.yellow,),
                                    Icon(Icons.star_border,color: Colors.yellow,),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                      CircleAvatar(radius: 20,backgroundColor: Colors.green,child: Center(child: Icon(Icons.favorite,color: Colors.white,size: 30,),)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){setState(() {
                          _opacity1=changeopacity(_opacity1);
                        });},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Opacity(opacity: _opacity1,child: Icon(Icons.check,color: Colors.green,),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){setState(() {
                          _opacity2=changeopacity(_opacity2);
                        });},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Opacity(opacity: _opacity2,child: Icon(Icons.check,color: Colors.green,),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){setState(() {
                          _opacity3=changeopacity(_opacity3);
                        });},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Opacity(opacity: _opacity3,child: Icon(Icons.check,color: Colors.green,),),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){setState(() {
                          _opacity4=changeopacity(_opacity4);
                        });},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: Opacity(opacity: _opacity4,child: Icon(Icons.check,color: Colors.green,),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque non felis sem. Vestibulum tincidunt varius velit in facilisis. Ut eu nunc at libero placerat hendrerit. Morbi quis ornare dui. Cras at sapien a velit pretium accumsan eget in ex. Quisque ac odio tristique, semper mauris eu, posuere metus",style: TextStyle(fontSize: 17),),
                Center(child: Text("\nReviews",style: TextStyle(color: Colors.green,fontSize: 20),)),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Container(
                    height: 300,
                    //color: Colors.redAccent.withOpacity(.6),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: Row(
                              children: [
                                Icon(Icons.person_pin,size: 50,),
                                Column(
                                  children: [
                                    Text("Name",style: TextStyle(fontSize: 20),),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star_border,color: Colors.yellow,),
                                        Icon(Icons.star_border,color: Colors.yellow,),
                                      ],
                                    ),

                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque non felis sem. Vestibulum tincidunt varius velit in facilisis. Ut eu nunc at libero placerat hendrerit. Morbi quis ornare dui. Cras at sapien a velit pretium accumsan eget in ex. Quisque ac odio tristique, semper mauris eu, posuere metus",style: TextStyle(fontSize: 17),),                      ],
                    ),
                    //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),

                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),
                Card(
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child:Container(
                    height: 300,
                    //color: Colors.redAccent.withOpacity(.6),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 200,
                            child: Row(
                              children: [
                                Icon(Icons.person_pin,size: 50,),
                                Column(
                                  children: [
                                    Text("Name",style: TextStyle(fontSize: 20),),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star_border,color: Colors.yellow,),
                                        Icon(Icons.star_border,color: Colors.yellow,),
                                      ],
                                    ),

                                  ],
                                )

                              ],
                            ),
                          ),
                        ),
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque non felis sem. Vestibulum tincidunt varius velit in facilisis. Ut eu nunc at libero placerat hendrerit. Morbi quis ornare dui. Cras at sapien a velit pretium accumsan eget in ex. Quisque ac odio tristique, semper mauris eu, posuere metus",style: TextStyle(fontSize: 17),),                      ],
                    ),
                    //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),

                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  margin: EdgeInsets.all(10),
                ),

              ],
            ),
          ),
        ),
          bottomNavigationBar:Container(
            height: 80,
            child: BottomNavigationBar(
                //backgroundColor: Colors.blue,
                selectedItemColor: Colors.white,


                items:  <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            //color: Colors.green,
                            borderRadius: BorderRadius.all(Radius.circular(50))
                        ),
                        child: Container(decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(30))),height: 50,width:width*.8,child: FlatButton(onPressed:  (){Navigator.pushNamed(context, '/cart');}, child: Text("Add To Cart",style: TextStyle(color: Colors.green,fontSize: 15),)))),
                    title: Container(),

                  ),
                  BottomNavigationBarItem(
                    icon: GestureDetector(
                      onTap: (){Navigator.pushNamed(context, '/cart');},
                      child: Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                        child: Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 50,width:width*.8,child: FlatButton(onPressed:  (){Navigator.pushNamed(context, '/cart');}, child: Text("Pay Now",style: TextStyle(color: Colors.white,fontSize: 17),))))
                    ),
                    title: Container(),

                  ),
                ],
              ),
          ),


      ),
    );
  }
}


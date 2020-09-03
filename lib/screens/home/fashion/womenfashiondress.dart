import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class WomenDressDetailPage extends StatefulWidget {
  @override
  _WomenDressDetailPageState createState() => _WomenDressDetailPageState();
}

class _WomenDressDetailPageState extends State<WomenDressDetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top:6.0),
            child: Container(
              width: width*.8,
              height: 45,

              child: Material(
                elevation: 5,
                shape: StadiumBorder(),
                child: TextFormField(
                  // key: __passwordkey,
                  enableInteractiveSelection: true,
                  decoration: InputDecoration(

                      border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,10,0),
                        child: Icon(Icons.search,size: 35,color: Colors.green.withOpacity(.75),),
                      ),
                      hintText: "Search for Products"
                  ),
                  validator: (value){},
                ),
              ),
            ),
          ),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,), onPressed: (){Navigator.pop(context);}),
          backgroundColor: Colors.transparent,
          elevation: 0,


        ),
        body: Center(
          child: Container(
            width: width,
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/productsdetail');},
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/Union1.png'),fit: BoxFit.fitHeight,
                            alignment: Alignment.topCenter,)
                      ),
                      /* decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage())
                              ),*/
                      child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/productsdetail');},
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/Union1.png'),fit: BoxFit.fitHeight,
                            alignment: Alignment.topCenter,)
                      ),
                      /* decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage())
                              ),*/
                      child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/productsdetail');},
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/Union1.png'),fit: BoxFit.fitHeight,
                            alignment: Alignment.topCenter,)
                      ),
                      /* decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage())
                              ),*/
                      child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/productsdetail');},
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/Union1.png'),fit: BoxFit.fitHeight,
                            alignment: Alignment.topCenter,)
                      ),
                      /* decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage())
                              ),*/
                      child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/productsdetail');},
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/Union1.png'),fit: BoxFit.fitHeight,
                            alignment: Alignment.topCenter,)
                      ),
                      /* decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage())
                              ),*/
                      child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/productsdetail');},
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/Union1.png'),fit: BoxFit.fitHeight,
                            alignment: Alignment.topCenter,)
                      ),
                      /* decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage())
                              ),*/
                      child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

                    ),
                  ),
                ), GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/productsdetail');},
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/Union1.png'),fit: BoxFit.fitHeight,
                            alignment: Alignment.topCenter,)
                      ),
                      /* decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage())
                              ),*/
                      child: FractionallySizedBox(alignment: Alignment.bottomCenter,heightFactor: .4,child: Container(decoration: BoxDecoration(color:Colors.green,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))),child: Center(child: Text("Some Description")),),),

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


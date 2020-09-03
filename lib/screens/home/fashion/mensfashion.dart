import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';



class MensFashionScreen extends StatefulWidget {
  @override
  _MensFashionScreenState createState() => _MensFashionScreenState();
}

class _MensFashionScreenState extends State<MensFashionScreen> {
  int _index=0;
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0,18.0,0,18),
                child: Row(
                  children: [
                    IconButton(icon: Icon(Icons.arrow_back,color: Colors.green,), onPressed: (){Navigator.pop(context);}),
                    Container(
                      width: width*.8,
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Suits",style: TextStyle(fontSize: 20,color: Colors.green),),
                    Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/womenfashiondress');}, child: Text("More"))),

                  ],
                ),
              ),
              Container(
                width: width,
                height: 200,
                child:PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.9,
                      child: GestureDetector(
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
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Shirts",style: TextStyle(fontSize: 20,color: Colors.green),),
                    Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/womenfashiondetail');}, child: Text("More"))),

                  ],
                ),
              ),
              Container(
                width: width,
                height: 200,
                child:PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.9,
                      child: GestureDetector(
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
                    );
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("T-Shirts",style: TextStyle(fontSize: 20,color: Colors.green),),
                    Container(decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.all(Radius.circular(30))),height: 30,width:width*.2,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/womenfashiondetail');}, child: Text("More"))),

                  ],
                ),
              ),
              Container(
                width: width,
                height: 200,
                child:PageView.builder(
                  itemCount: 4,
                  controller: PageController(viewportFraction: 0.4),
                  onPageChanged: (int index) => setState(() => _index = index),
                  itemBuilder: (_, i) {
                    return Transform.scale(
                      scale: i == _index ? 1 : 0.9,
                      child: GestureDetector(
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
                    );
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


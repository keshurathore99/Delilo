import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';


class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  int _index=0;
  String categoryselectedoption;
  List<String> categoryselectedoptionlist = ['Yes','No','Sometimes'];
  String colorselectedoption;
  List<String> colorselectedoptionlist = ['Yes','No','Sometimes'];
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return Scaffold(
      body: Center(
        child: Container(
          //width: ,
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
                            child: Image.asset('assets/images/Union1.png'),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment(1,-1),
                child: FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Colors.green, onPressed: () {},
                ),
              ),
              Container(
                padding: EdgeInsets.all(22.0),
                child: ListTile(
                  //title: Text("Your Current Location"),
                  title: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      hint: Text('Please Choose The Category'),
                      value: categoryselectedoption,
                      onChanged: (newValue) {
                        setState(() {
                          categoryselectedoption = newValue;
                        });
                      },
                      items: categoryselectedoptionlist.map((selectedoption) {
                        return DropdownMenuItem(
                          child: new Text(selectedoption),
                          value: selectedoption,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Container(
                width: width*.8,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: width*.8,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            //key: _mobilenumberkey,
                            enableInteractiveSelection: true,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                                /*prefixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                  child: Icon(Icons.lock,size: 35,color: Colors.black.withOpacity(.75),),
                                ),*/
                                hintText: "Enter Name"
                            ),
                            validator: (value){},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: width*.8,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            //key: _mobilenumberkey,
                            enableInteractiveSelection: true,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
                                /*prefixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
                                  child: Icon(Icons.lock,size: 35,color: Colors.black.withOpacity(.75),),
                                ),*/
                                hintText: "Enter Price"
                            ),
                            validator: (value){},
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        width: width*.8,
                        child: Material(
                          elevation: 5,
                          shape: StadiumBorder(),
                          child: TextFormField(
                            //key: _mobilenumberkey,
                            enableInteractiveSelection: true,
                            decoration: InputDecoration(

                                border: OutlineInputBorder(borderSide: BorderSide(width: 4),borderRadius: BorderRadius.all(Radius.circular(30))),
//                                prefixIcon: Padding(
//                                  padding: const EdgeInsets.fromLTRB(10,0,10,0),
//                                  child: Icon(Icons.lock,size: 35,color: Colors.black.withOpacity(.75),),
//                                ),
                                hintText: "Enter Description"
                            ),
                            validator: (value){},
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(22.0),
                      child: ListTile(
                        //title: Text("Your Current Location"),
                        title: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Text('Please Choose Color'),
                            value: colorselectedoption,
                            onChanged: (newValue) {
                              setState(() {
                                colorselectedoption = newValue;
                              });
                            },
                            items: colorselectedoptionlist.map((selectedoption) {
                              return DropdownMenuItem(
                                child: new Text(selectedoption),
                                value: selectedoption,
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(decoration: BoxDecoration(color: Colors.green[700],borderRadius: BorderRadius.all(Radius.circular(30))),height: 55,width:width*.75,child: FlatButton(onPressed: (){Navigator.pushNamed(context, '/addproductpage');}, child: Text("Add Product",style: TextStyle(color: Colors.white,fontSize: 20),))),
                  ],
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}


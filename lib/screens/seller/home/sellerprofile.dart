import 'package:delilo/screens/seller/home/sellerdrawer.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';

class SellerProfile extends StatefulWidget {
  @override
  _SellerProfileState createState() => _SellerProfileState();
}

class _SellerProfileState extends State<SellerProfile> {
  @override
  Widget build(BuildContext context) {
    double height = displayHeight(context);
    double width = displayWidth(context);
    return SafeArea(
      
      child: Scaffold(
        drawer: SellerDrawer(),
        appBar: PreferredSize(child: AppBar(leading:Builder(
            builder: (context){
              return GestureDetector(
                onTap: (){
                  Scaffold.of(context).openDrawer();
                },
                child: Icon(Icons.menu,color: Colors.white,),//Image.asset('assets/images/u.png'),
              );
            }
        ),elevation: 0,backgroundColor: Color.fromRGBO(12, 159, 12,1),),preferredSize: Size.fromHeight(60),),
        body: Center(
          child: Container(
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('assets/images/backh.png')
              ),
            ),
            child: ListView(
              children: [
                Container(
                  width: width*.90,
                  height: height*.25,
                  child: Icon(Icons.person_pin,size: 80,),
                ),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Shop Name",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Owner Name",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Mobile Number",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Email ID",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Listing Products",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Cancelled Cheque",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Business Details",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Signature",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Adress",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),
                Divider(color: Colors.grey,height: 1,),
                GestureDetector(
                  onTap: (){Navigator.pushNamed(context, '/sellerhome');},
                  child: ListTile(
                    onLongPress: null,
                    title: Container(

                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text(
                              "Bank Details",
                              style: TextStyle(
                                //fontSize: 15,
                                  color: Colors.green),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(1.0),
                            child: Icon(Icons.arrow_forward_ios,color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(color: Colors.grey,height: 1,),


                
              ],
            ),
          ),
        ),
      ),
    );
  }
}


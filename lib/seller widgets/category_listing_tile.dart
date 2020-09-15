import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:flutter/material.dart';

class CategoryListingTile extends StatefulWidget {
  final Map product;
  final String pathToDoc;
  final GlobalKey<ScaffoldState> scaffoldKey;
  CategoryListingTile(this.product, this.pathToDoc, this.scaffoldKey);

  @override
  _CategoryListingTileState createState() => _CategoryListingTileState();
}

class _CategoryListingTileState extends State<CategoryListingTile> {
  bool inStock = true;
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return InkWell(
      onLongPress: () {
        _showDeleteDialog(context);
      },
      onTap: () {
        _showDialog(context);
      },
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        height: displayHeight(context) / 5,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/fashion/fashion7.jpg'),
                    image: NetworkImage(product['image1']),
                  )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        child: Text(
                          '${product['name']},${product['productType'].toString()}',
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        child: Text('₹ ' + product['price']),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        child: Text('Available Colors'),
                      ),
                    ],
                  ),
                ),
              ),
              Switch(
                  activeColor: Colors.green,
                  value: inStock,
                  onChanged: (value) {
                    setState(() {
                      inStock = value;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => Dialog(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Change Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            hintText: 'New Name',
                            contentPadding: EdgeInsets.only(left: 8),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.green, width: 1)),
                            border: OutlineInputBorder()),
                        keyboardType: TextInputType.name,
                      ),
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.green,
                      textColor: Colors.white,
                      onPressed: () async {
                        if (_nameController.text.isNotEmpty) {
                          await Firestore.instance
                              .document(widget.pathToDoc)
                              .updateData({'name': _nameController.text});
                          widget.scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text('Updated Successfully')));
                          Navigator.pop(context);
                          setState(() {});
                        } else {
                          widget.scaffoldKey.currentState.showSnackBar(
                              SnackBar(content: Text('Name Cannot Be Empty')));
                        }
                      },
                      child: Text('Save'),
                    ),
                  ],
                ),
              ),
            ));
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text('Are You Sure?\nThis Item Will Be Deleted'),
              actions: [
                FlatButton(
                  textColor: Colors.green,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'),
                ),
                FlatButton(
                  textColor: Colors.green,
                  onPressed: () async {
                    await Firestore.instance
                        .document(widget.pathToDoc)
                        .delete();
                    widget.scaffoldKey.currentState.showSnackBar(SnackBar(
                        content: Text('The Product is Deleted Successfully')));
                    setState(() {});
                  },
                  child: Text('Yes'),
                ),
              ],
            ));
  }
}

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delilo/constants/decoration_constants.dart';
import 'package:delilo/screens/seller/home/sellerhomesceen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:delilo/screens/auxillary/customclasses.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class NewProductPage extends StatefulWidget {
  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  String categoryselectedoption;
  List<String> categoryselectedoptionlist = [
    "Men's Suit",
    "Men's Shirt",
    "Men's T-shirt",
    "Women's Dress",
    "Women's Top",
    "Women's Traditional",
    "Baby Cloths",
    "Girl Kids",
    "Boy Kids",
  ];

  String mainCategorySelected;

  final mainCategoryList = [
    'Mobile',
    'Fashion',
    'Household',
    'Beauty & Health',
    'Toys & Baby Products',
    'Party & Gatherings',
    'Sports',
    'Dairy',
    'Travel & Explore',
  ];

  String colorselectedoption;
  List<String> colorselectedoptionlist = ['Yes', 'No', 'Sometimes'];

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  File _image1;
  File _image2;
  File _image3;
  File _image4;
  bool _loading = false;
  bool isFashionCategory = false;

  @override
  Widget build(BuildContext context) {
    double width = displayWidth(context);
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        key: _scaffoldKey,
        body: Center(
          child: Container(
            child: ListView(
              children: [
                Container(
                  width: width,
                  height: 350,
                  child: PageView(
                    controller: PageController(viewportFraction: 1),
                    children: [
                      Card(
                        child: _image1 == null
                            ? null
                            : Image.file(
                                _image1,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Card(
                        child: _image2 == null
                            ? null
                            : Image.file(
                                _image2,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Card(
                        child: _image3 == null
                            ? null
                            : Image.file(
                                _image3,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Card(
                        child: _image4 == null
                            ? null
                            : Image.file(
                                _image4,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ],
                  ),
                ),
                addButton(),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 22),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    //title: Text("Your Current Location"),
                    title: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text('Category'),
                        value: mainCategorySelected,
                        onChanged: (newValue) {
                          setState(() {
                            mainCategorySelected = newValue;
                          });
                          if (mainCategorySelected == 'Fashion') {
                            setState(() {
                              isFashionCategory = true;
                            });
                          } else {
                            setState(() {
                              isFashionCategory = false;
                            });
                          }
                        },
                        items: mainCategoryList.map((selectedoption) {
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
                  padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 4),
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    title: DropdownButtonHideUnderline(
                      child: DropdownButton(
                          hint: Text('Please Choose The Category'),
                          value: isFashionCategory == false
                              ? null
                              : categoryselectedoption,
                          onChanged: (newValue) {
                            setState(() {
                              categoryselectedoption = newValue;
                            });
                          },
                          items: isFashionCategory == true
                              ? categoryselectedoptionlist
                                  .map((selectedoption) {
                                  return DropdownMenuItem(
                                    child: new Text(selectedoption),
                                    value: selectedoption,
                                  );
                                }).toList()
                              : null),
                    ),
                  ),
                ),
                Container(
                  width: width * .8,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: width * .8,
                          child: Material(
                            elevation: 5,
                            shape: StadiumBorder(),
                            child: TextFormField(
                              controller: _nameController,
                              enableInteractiveSelection: true,
                              decoration: decoratedTextFieldForNewProduct
                                  .copyWith(hintText: 'Product Name'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: width * .8,
                          child: Material(
                            elevation: 5,
                            shape: StadiumBorder(),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _priceController,
                              enableInteractiveSelection: true,
                              decoration: decoratedTextFieldForNewProduct
                                  .copyWith(hintText: 'Price'),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: width * .8,
                          child: Material(
                            elevation: 5,
                            shape: StadiumBorder(),
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              controller: _descriptionController,
                              enableInteractiveSelection: true,
                              decoration: decoratedTextFieldForNewProduct
                                  .copyWith(hintText: 'Description'),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  child: MaterialButton(
                    minWidth: 20,
                    elevation: 5,
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () async {
                      if (_nameController.text.isEmpty ||
                          _priceController.text.isEmpty ||
                          _descriptionController.text.isEmpty ||
                          mainCategorySelected == null) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text('Please Fill All The Fields First'),
                        ));
                        return;
                      }

                      if (mainCategorySelected == 'Fashion') {
                        if (categoryselectedoption == null) {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content:
                                  Text('Please Select Sub Category First')));
                          return;
                        }
                      }

                      if (_image1 == null) {
                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text('Please Upload a Picture First')));
                        return;
                      }

                      setState(() {
                        _loading = true;
                      });

                      final user = await FirebaseAuth.instance.currentUser();
                      final uid = user.uid;

                      final firebaseStorage = FirebaseStorage.instance
                          .ref()
                          .child('products')
                          .child(uid);

                      final time = DateTime.now().millisecondsSinceEpoch;
                      final randomTime = time.toString();

                      String image1, image2, image3, image4;

                      try {
                        if (_image1 != null) {
                          final task1 = await firebaseStorage
                              .child(randomTime)
                              .child('image1')
                              .putFile(_image1)
                              .onComplete;
                          image1 = await task1.ref.getDownloadURL();
                        }

                        if (_image2 != null) {
                          final task2 = await firebaseStorage
                              .child(randomTime)
                              .child('image2')
                              .putFile(_image2)
                              .onComplete;
                          image2 = await task2.ref.getDownloadURL();
                        }

                        if (_image3 != null) {
                          final task3 = await firebaseStorage
                              .child(randomTime)
                              .child('image3')
                              .putFile(_image3)
                              .onComplete;
                          image3 = await task3.ref.getDownloadURL();
                        }

                        if (_image4 != null) {
                          final task4 = await firebaseStorage
                              .child(randomTime)
                              .child('image4')
                              .putFile(_image4)
                              .onComplete;
                          image4 = await task4.ref.getDownloadURL();
                        }
                      } catch (e) {
                        _scaffoldKey.currentState
                            .showSnackBar(SnackBar(content: Text(e)));
                      }

                      final mainCategory = selectMainCategory();

                      if (mainCategory != 'fashion') {
                        setState(() {
                          _loading = true;
                        });

                        final sellerSnapshot = await Firestore.instance
                            .collection('sellers')
                            .document(uid)
                            .get();

                        final docRef = await Firestore.instance
                            .collection(mainCategory)
                            .add({
                          'name': _nameController.text,
                          'price': _priceController.text,
                          'shop_name':
                              sellerSnapshot.data['shop_name'] ?? 'Unavailable',
                          'description': _descriptionController.text,
                          'reviews': [],
                          'ratings': 0.0,
                          'productType': mainCategory,
                          'inStock': true
                        });

                        if (image1 != null) {
                          Firestore.instance
                              .collection(mainCategory)
                              .document(docRef.documentID)
                              .updateData({'image1': image1});
                        }

                        if (image2 != null) {
                          Firestore.instance
                              .collection(mainCategory)
                              .document(docRef.documentID)
                              .updateData({'image2': image2});
                        }

                        if (image3 != null) {
                          Firestore.instance
                              .collection(mainCategory)
                              .document(docRef.documentID)
                              .updateData({'image3': image3});
                        }

                        if (image4 != null) {
                          Firestore.instance
                              .collection(mainCategory)
                              .document(docRef.documentID)
                              .updateData({'image4': image4});
                        }

                        await Firestore.instance
                            .collection(mainCategory)
                            .document(docRef.documentID)
                            .updateData({
                          'productId': docRef.documentID,
                          'sellerId': uid
                        });

                        final snapshot = await Firestore.instance
                            .collection('sellers')
                            .document(uid)
                            .get();

                        final productsList = snapshot.data['products'] as List;

                        if (productsList != null) {
                          productsList
                              .add('$mainCategory/${docRef.documentID}');

                          await Firestore.instance
                              .collection('sellers')
                              .document(uid)
                              .updateData({
                            'products': [...productsList],
                          });
                        } else {
                          final newProductList = [
                            '$mainCategory/${docRef.documentID}'
                          ];

                          await Firestore.instance
                              .collection('sellers')
                              .document(uid)
                              .updateData({
                            'products': newProductList,
                          });
                        }

                        setState(() {
                          _loading = false;
                        });

                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content:
                                Text('New Product Uploaded Successfully')));

                        Navigator.of(context).pop();

                        return;
                      }

                      final category = selectSubCategory();

                      final sellerSnapshot = await Firestore.instance
                          .collection('sellers')
                          .document(uid)
                          .get();

                      try {
                        final ref = await Firestore.instance
                            .collection('fashion')
                            .document(category['category'])
                            .collection(category['clothType'])
                            .add({
                          'name': _nameController.text,
                          'price': _priceController.text,
                          'shop_name':
                              sellerSnapshot.data['shop_name'] ?? 'Unavailable',
                          'description': _descriptionController.text,
                          'reviews': [],
                          'ratings': 0.0,
                          'productType': 'fashion' +
                              ' ' +
                              category['category'] +
                              ' ' +
                              category['clothType'],
                          'inStock': true,
                        });

                        if (image1 != null) {
                          Firestore.instance
                              .collection('fashion')
                              .document(category['category'])
                              .collection(category['clothType'])
                              .document(ref.documentID)
                              .updateData({'image1': image1});
                        }

                        if (image2 != null) {
                          Firestore.instance
                              .collection('fashion')
                              .document(category['category'])
                              .collection(category['clothType'])
                              .document(ref.documentID)
                              .updateData({'image2': image2});
                        }

                        if (image3 != null) {
                          Firestore.instance
                              .collection('fashion')
                              .document(category['category'])
                              .collection(category['clothType'])
                              .document(ref.documentID)
                              .updateData({'image3': image3});
                        }

                        if (image4 != null) {
                          Firestore.instance
                              .collection('fashion')
                              .document(category['category'])
                              .collection(category['clothType'])
                              .document(ref.documentID)
                              .updateData({'image4': image4});
                        }

                        await Firestore.instance
                            .collection('fashion')
                            .document(category['category'])
                            .collection(category['clothType'])
                            .document(ref.documentID)
                            .updateData(
                                {'productId': ref.documentID, 'sellerId': uid});

                        final snapshot = await Firestore.instance
                            .collection('sellers')
                            .document(uid)
                            .get();

                        final productsList = snapshot.data['products'] as List;
                        productsList.add(
                            'fashion/${category['category']}/${category['clothType']}/${ref.documentID}');
                        await Firestore.instance
                            .collection('sellers')
                            .document(uid)
                            .updateData({
                          'products': [...productsList],
                        });

                        setState(() {
                          _loading = false;
                        });

                        _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content:
                                Text('New Product Uploaded Successfully')));

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) =>
                                    SellerHomeScreen(userUid: uid)),
                            (route) => false);
                      } catch (e) {
                        _scaffoldKey.currentState
                            .showSnackBar(SnackBar(content: Text(e)));
                      }
                    },
                    child: Text('Save'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addButton() {
    return Align(
      alignment: Alignment(1, -1),
      child: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
        onPressed: () async {
          final file =
              await ImagePicker().getImage(source: ImageSource.gallery);

          if (_image1 == null) {
            setState(() {
              _image1 = File(file.path);
            });
          } else if (_image2 == null) {
            setState(() {
              _image2 = File(file.path);
            });
          } else if (_image3 == null) {
            setState(() {
              _image3 = File(file.path);
            });
          } else if (_image4 == null) {
            setState(() {
              _image4 = File(file.path);
            });
          }
        },
      ),
    );
  }

  Map<String, String> selectSubCategory() {
    final Map<String, String> map = {};

    switch (categoryselectedoption) {
      case "Men's Suit":
        map['category'] = 'men';
        map['clothType'] = 'suits';
        break;

      case "Men's Shirt":
        map['category'] = 'men';
        map['clothType'] = 'shirts';
        break;

      case "Men's T-shirt":
        map['category'] = 'men';
        map['clothType'] = 'tshirts';
        break;

      case "Women's Dress":
        map['category'] = 'women';
        map['clothType'] = 'dress';
        break;

      case "Women's Top":
        map['category'] = 'women';
        map['clothType'] = 'top';
        break;

      case "Women's Traditional":
        map['category'] = 'women';
        map['clothType'] = 'traditional';
        break;

      case "Baby Cloths":
        map['category'] = 'kids';
        map['clothType'] = 'baby';
        break;

      case "Girl Kids":
        map['category'] = 'kids';
        map['clothType'] = 'girls';
        break;

      case "Boy Kids":
        map['category'] = 'kids';
        map['clothType'] = 'boy';
        break;

      default:
        map['category'] = 'null';
        map['clothType'] = 'null';
    }

    return map;
  }

  String selectMainCategory() {
    String category;
    switch (mainCategorySelected) {
      case 'Mobile':
        category = 'mobile';
        break;

      case 'Fashion':
        category = 'fashion';
        break;

      case 'Household':
        category = 'household';
        break;

      case 'Beauty & Health':
        category = 'beauty';
        break;

      case 'Toys & Baby Products':
        category = 'toys';
        break;

      case 'Party & Gatherings':
        category = 'party';
        break;

      case 'Sports':
        category = 'sports';
        break;

      case 'Dairy':
        category = 'dairy';
        break;

      case 'Travel & Explore':
        category = 'travel';
        break;

      default:
        category = 'null';
    }
    return category;
  }
}

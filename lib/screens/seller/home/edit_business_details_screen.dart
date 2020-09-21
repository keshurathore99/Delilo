import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditBusinessDetailsScreen extends StatefulWidget {
  final userUid;
  EditBusinessDetailsScreen(this.userUid);

  @override
  _EditBusinessDetailsScreenState createState() =>
      _EditBusinessDetailsScreenState();
}

class _EditBusinessDetailsScreenState extends State<EditBusinessDetailsScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _gstController = TextEditingController();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Edit Business Details'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textField('GST Number', _gstController, TextInputType.name),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_gstController.text.isEmpty) {
                      _scaffoldKey.currentState.showSnackBar(SnackBar(
                          content: Text(
                              'Please Fill All Of the Above Fields First')));
                      return;
                    }

                    setState(() {
                      _loading = true;
                    });

                    await Firestore.instance
                        .collection('sellers')
                        .document(widget.userUid)
                        .updateData({'gstin_number': _gstController.text});

                    setState(() {
                      _loading = false;
                    });

                    _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text('Updated Successfully')));
                  },
                  child: Text('Change'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(String hintText, TextEditingController controller,
      TextInputType keyboardType) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.only(left: 8),
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1))),
      ),
    );
  }
}

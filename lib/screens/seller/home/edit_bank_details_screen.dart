import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditBankDetailsScreen extends StatefulWidget {
  final userUid;
  EditBankDetailsScreen(this.userUid);

  @override
  _EditBankDetailsScreenState createState() => _EditBankDetailsScreenState();
}

class _EditBankDetailsScreenState extends State<EditBankDetailsScreen> {
  final _bankNameController = TextEditingController();

  final _accountNumberController = TextEditingController();

  final _ifscController = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Edit Bank Details'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textField('Account Holder Name', _bankNameController,
                  TextInputType.name),
              _textField('Account Number', _accountNumberController,
                  TextInputType.number),
              _textField('IFSC Code', _ifscController, TextInputType.number),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.green,
                  textColor: Colors.white,
                  onPressed: () async {
                    if (_accountNumberController.text.isEmpty ||
                        _bankNameController.text.isEmpty ||
                        _ifscController.text.isEmpty) {
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
                        .updateData({
                      'account_name': _bankNameController.text,
                      'account_number': _accountNumberController.text,
                      'ifsc_code': _ifscController.text
                    });

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

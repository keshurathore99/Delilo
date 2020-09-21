import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class ProfileEditScreen extends StatefulWidget {
  final String title;
  final String hintText;
  final String mapKey;

  ProfileEditScreen(this.title, this.hintText, this.mapKey);

  @override
  _ProfileEditScreenState createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  final _textController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _loading,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Edit Profile'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  keyboardType: widget.mapKey.contains('phone')
                      ? TextInputType.phone
                      : TextInputType.text,
                  controller: _textController,
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    contentPadding: EdgeInsets.only(left: 10),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 1)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  textColor: Colors.white,
                  color: Colors.green,
                  child: Text('Change'),
                  onPressed: () async {
                    if (_textController.text.isEmpty) {
                      _scaffoldKey.currentState.showSnackBar(
                          SnackBar(content: Text('Field Cannot be Empty')));
                      return;
                    }

                    setState(() {
                      _loading = true;
                    });

                    final user = await FirebaseAuth.instance.currentUser();
                    await Firestore.instance
                        .collection('sellers')
                        .document(user.uid)
                        .updateData({
                      widget.mapKey: _textController.text,
                    });

                    setState(() {
                      _loading = false;
                    });

                    _scaffoldKey.currentState.showSnackBar(
                        SnackBar(content: Text('Updated Successfully')));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

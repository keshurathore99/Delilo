import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  final userUid;
  HistoryScreen(this.userUid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: StreamBuilder<DocumentSnapshot>(
          stream: Firestore.instance
              .collection('users')
              .document(userUid)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null) {
              return Center(
                child: Text('No History Till Now'),
              );
            }

            final historyList = snapshot.data.data['history'] as List;

            if (historyList == null || historyList.length == 0) {
              return Center(
                child: Text('No History Till Now'),
              );
            }

            return ListView.builder(
                itemCount: historyList.length,
                itemBuilder: (context, index) {
                  final history = historyList[index];
                  return Card(
                    child: ListTile(
                      title: Text(history['action']),
                      subtitle: Text(DateFormat.MMMMEEEEd()
                          .add_jm()
                          .format((history['dateTime'] as Timestamp).toDate())),
                    ),
                  );
                });
          }),
    );
  }
}

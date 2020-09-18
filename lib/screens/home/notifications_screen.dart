import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  final userUid;
  NotificationScreen(this.userUid);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.green,
        centerTitle: true,
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

            final notificationsList =
                snapshot.data.data['notifications'] as List;

            if (notificationsList.length == 0) {
              return Center(
                child: Text('No New Notifications Till Now'),
              );
            }

            return ListView.builder(
                itemCount: notificationsList.length,
                itemBuilder: (context, index) {
                  return NotificationTile(
                    imageLink: notificationsList[index]['productImage'],
                    message: notificationsList[index]['message'],
                    time: (notificationsList[index]['dateTime'] as Timestamp)
                        .toDate(),
                  );
                });
          }),
    );
  }
}

class NotificationTile extends StatelessWidget {
  final String message;
  final DateTime time;
  final String imageLink;
  NotificationTile({this.message, this.time, this.imageLink});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/fashion/fashion7.jpg'),
                image: NetworkImage(imageLink),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  message,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    DateFormat.MMMMEEEEd().add_jm().format(time),
                    textAlign: TextAlign.right,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

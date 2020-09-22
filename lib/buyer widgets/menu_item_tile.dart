import 'package:flutter/material.dart';

class MenuItemTile extends StatelessWidget {
  final Widget pageToOpen;
  final String title;
  final String imageRoute;
  final bool isFavoriteTab;
  MenuItemTile(this.pageToOpen, this.title, this.imageRoute,
      {this.isFavoriteTab: false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => pageToOpen));
      },
      child: ListTile(
        leading: isFavoriteTab
            ? Icon(
                Icons.favorite,
                color: Colors.brown,
                size: 30,
              )
            : Image.asset(imageRoute),
        title: Container(
          height: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    //fontSize: 15,
                    color: Colors.black87),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.black26),
            ],
          ),
        ),
      ),
    );
  }
}

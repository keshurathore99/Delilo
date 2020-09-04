import 'package:flutter/material.dart';

class MenuItemTile extends StatelessWidget {
  final String path;
  final String title;
  final String imageRoute;
  MenuItemTile(this.path, this.title, this.imageRoute);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: ListTile(
        leading: Image.asset(imageRoute),
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

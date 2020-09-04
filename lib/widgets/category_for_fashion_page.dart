import 'package:flutter/material.dart';

class CategoriesForFashionPage extends StatelessWidget {
  final String image;
  final String title;
  final String path;
  final isChildren;
  CategoriesForFashionPage(this.image, this.title, this.path,
      {this.isChildren: false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, path);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Positioned(
            right: isChildren ? 40 : null,
            child: Text(
              title,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

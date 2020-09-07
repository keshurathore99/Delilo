import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class UserReview extends StatelessWidget {
  final String name;
  final double rating;
  final String comment;
  final imageUrl;

  UserReview(
      {@required this.name,
      @required this.rating,
      @required this.comment,
      @required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.person_pin,
                      size: 50,
                    ),
                    Column(
                      children: [
                        Text(
                          name,
                          style: TextStyle(fontSize: 20),
                        ),
                        SmoothStarRating(
                          isReadOnly: true,
                          rating: rating,
                          color: Colors.yellow,
                          borderColor: Colors.yellow,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                comment,
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        //child: Center(child: Text("Stay Indoors Stay safe \n Consult Online Now",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic),)),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      margin: EdgeInsets.all(10),
    );
  }
}

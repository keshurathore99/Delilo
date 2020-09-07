import 'package:flutter/foundation.dart';

class Review {
  final String name;
  final double rating;
  final String imageUrl;
  final String reviewComment;

  Review(
      {@required this.name,
      @required this.rating,
      @required this.imageUrl,
      @required this.reviewComment});
}

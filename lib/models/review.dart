import 'package:flutter/foundation.dart';

class Review {
  final String name;
  final String rating;
  final String imageUrl;
  final reviewComment;

  Review(
      {@required this.name,
      @required this.rating,
      @required this.imageUrl,
      @required this.reviewComment});
}

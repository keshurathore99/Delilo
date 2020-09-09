import 'package:flutter/foundation.dart';

class Buyer {
  final String name;
  final String uid;
  final String email;
  final String phone;
  final String imageUrl;

  Buyer({
    @required this.name,
    @required this.uid,
    @required this.email,
    @required this.phone,
    this.imageUrl
  });
}

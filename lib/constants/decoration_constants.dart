import 'package:flutter/material.dart';

const registerTextFieldDecoration = InputDecoration(
    contentPadding: EdgeInsets.all(0),
    border: OutlineInputBorder(
        borderSide: BorderSide(width: 4),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black54),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    prefixIcon: Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Icon(
        Icons.person,
        size: 35,
        color: Colors.black,
      ),
    ),
    hintText: "Enter Username");

const decoratedTextFieldForNewProduct = InputDecoration(
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
    border: OutlineInputBorder(
        borderSide: BorderSide(width: 4, color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Colors.green),
        borderRadius: BorderRadius.all(Radius.circular(30))),
    hintText: "Enter Name");

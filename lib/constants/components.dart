import 'package:flutter/material.dart';


// siyonna baseurl
const kBaseUrl = 'https://siyonna-api.herokuapp.com/api/v1';

// Form Error
final RegExp emailValidatorRegExp =
RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

OutlineInputBorder enableOutline() {
  return OutlineInputBorder(
    borderSide:
    BorderSide(style: BorderStyle.solid, color: Color(0xFFC2C9D1)),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  );
}

OutlineInputBorder focusOutline() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.orangeAccent),
    borderRadius: BorderRadius.all(Radius.circular(6)),
  );
}

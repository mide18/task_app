import 'package:flutter/material.dart';

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

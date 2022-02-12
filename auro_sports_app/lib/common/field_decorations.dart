import 'package:flutter/material.dart';


InputDecoration textFieldDecoration({String? hintText}) {
  return InputDecoration(
    hintText: hintText ?? '',
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orangeAccent),
        borderRadius: BorderRadius.circular(25)),
  );
}
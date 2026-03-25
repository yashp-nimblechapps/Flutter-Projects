import 'package:flutter/material.dart';

// Without Arguments
TextStyle mainTextStyle() {
  return TextStyle(
    fontSize: 40,
  );
}

// With Arguments
TextStyle mainTextStyle2({Color textColor = Colors.black,}) {
  return TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: textColor,
  );
}

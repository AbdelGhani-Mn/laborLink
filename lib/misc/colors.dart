import 'package:flutter/material.dart';

class AppColors{
  static const Color white = Colors.white;
  static const Color black = Colors.black87;
  static const Color secondaryColor = Color(0xFFDBDBDB);
  static const Color textColor= Color.fromARGB(250,226, 149, 120);
  static const Color mainColor= Color.fromARGB(250,131, 197, 190);
  static const Color buttonColor= Color.fromARGB(250,0, 109, 119);
  static const Color backgroundColor= Color.fromARGB(250,237, 246, 249);
}
final buttonDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(
    color:const Color(0xFFDBDBDB),
    width: 0.8,
  ),
  borderRadius: BorderRadius.circular(4),
);
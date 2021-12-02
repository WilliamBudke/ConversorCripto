import 'package:conversorcripto/views/HomePage.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(brightness: Brightness.light),
    darkTheme: ThemeData(
      brightness: Brightness.dark,
    ),
  ));
}
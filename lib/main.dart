import 'package:flutter/material.dart';
import 'package:mobietech/pages/categories.dart';
import 'package:mobietech/pages/choosecountry.dart';
import 'package:mobietech/pages/home.dart';
import 'package:mobietech/pages/login.dart';
import 'package:mobietech/pages/post.dart';
import 'package:mobietech/pages/samsung.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Mobietech",
      home: Home(),
      routes: {
        'categories': (context) {
          return Categories();
        },
        'homepage': (context) {
          return Home();
        },
        "samsung": (context) {
          return Samsung();
        },
        "choosecountry": (context) {
          return ChooseCountry();
        },
        "login": (context) {
          return Login();
        },
        "post": (context) {
          return Post();
        }
      },
    );
  }
}

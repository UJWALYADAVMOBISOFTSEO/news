// @dart=2.9
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'NewsDetail.dart';
import 'NewsList.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsList(),
    );
  }
}
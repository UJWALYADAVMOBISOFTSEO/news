import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
      cardColor: Colors.white,
      canvasColor: Colors.white,
      accentColor: darkBluish,
      buttonColor: Colors.yellow,
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme.copyWith(
              headline6: context.textTheme.headline6?.copyWith(
                  color: Colors
                      .black)))); //COPY with use ho raha hai appbar k text ka color change karnde

  static ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
/*    primarySwatch: Colors.pink,*/
      // fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.black,
      canvasColor: darkBlack,
      accentColor: Colors.white,
      buttonColor: Colors.yellow,
      appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
              headline6:
                  context.textTheme.headline6?.copyWith(color: Colors.white))));

  //COLORS
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluish = Color(0xff403b58);
  static Color darkBlack = Vx.gray900;
  static Color lightBlue = Vx.indigo500;
}

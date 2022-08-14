import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) => ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      canvasColor: Colors.transparent,
      primaryColor: Colors.blue,
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,

      // inputDecorationTheme: digicitFormTheme,
      // cursorColor: kColorDeepPurple,
      // textSelectionColor: kColorLightPurple,
      // textSelectionHandleColor: kColorDeepPurple,
      fontFamily: 'raleway',
    );

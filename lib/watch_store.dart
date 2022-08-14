import 'package:flutter/material.dart';
import 'package:watch_store/app/screens/home_screen.dart';
import 'package:watch_store/src/res/theme/app_theme.dart';

class WatchStore extends StatelessWidget {
  const WatchStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watch Store',
      theme: appTheme(context),
      home: const HomeScreen(),
    );
  }
}

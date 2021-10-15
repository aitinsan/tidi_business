import 'package:flutter/material.dart';
import 'package:tidi_business/ui/intro/intro.screen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HomeBank User',
      // theme: kThemeData,
      home: IntroScreen(),
    );
  }
}

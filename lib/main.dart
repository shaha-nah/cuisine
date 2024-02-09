import 'package:flutter/material.dart';
import 'package:cuisine/widgets/bottom_navigation.dart';

void main() => runApp(const Cuisine());

class Cuisine extends StatelessWidget {
  const Cuisine ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuisine',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: const Color.fromRGBO(60, 24, 137, 0.8),
      ),
      home: const BottomNavigation(),
    );
  }
}
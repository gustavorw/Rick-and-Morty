import 'package:flutter/material.dart';
import 'package:rick/src/presenter/page/character_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CharacterPage());
  }
}

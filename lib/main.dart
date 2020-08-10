import 'package:flutter/material.dart';
import 'screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
          primaryColor: Color(0xFFe63946),
          accentColor: Color(0xFFa8dadc),
          splashColor: Color(0xFF457b9d),
          secondaryHeaderColor: Color(0xFF1d3557)),
      darkTheme: ThemeData.dark(),
    );
  }
}

import 'package:flutter/material.dart';
import './screens/home.dart';
// import './screens/map.dart';
// import './screens/contact.dart';
// import './screens/friend.dart';
// import './screens/detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

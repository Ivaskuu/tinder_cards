import 'package:flutter/material.dart';
import 'swipe_feed_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinder cards demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SwipeFeedPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'swipe_feed_page.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return new MaterialApp
    (
      title: 'Tinder cards demo',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new SwipeFeedPage(),
    );
  }
}
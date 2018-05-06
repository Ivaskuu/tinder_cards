import 'package:flutter/material.dart';
import 'cards_section_alignment.dart';
import 'cards_section_draggable.dart';

class SwipeFeedPage extends StatefulWidget
{
  @override
  _SwipeFeedPageState createState() => new _SwipeFeedPageState();
}

class _SwipeFeedPageState extends State<SwipeFeedPage>
{
  bool showAlignmentCards = false;
  
  @override
  Widget build(BuildContext context)
  {
    return new Scaffold
    (
      appBar: new AppBar
      (
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: new IconButton
        (
          onPressed: () {},
          icon: new Icon(Icons.settings, color: Colors.grey)
        ),
        title: new Switch
        (
          onChanged: (bool newValue) => setState(() => showAlignmentCards = newValue),
          value: showAlignmentCards,
          activeColor: Colors.red,
        ),
        actions: <Widget>
        [
          new IconButton
          (
            onPressed: () {},
            icon: new Icon(Icons.question_answer, color: Colors.grey)
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: new Column
      (
        children: <Widget>
        [
          showAlignmentCards ? new CardsSectionAlignment(context) : new CardsSectionDraggable(),
          buttonsRow()
        ],
      ),
    );
  }

  Widget buttonsRow()
  {
    return new Container
    (
      margin: new EdgeInsets.symmetric(vertical: 48.0),
      child: new Row
      (
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>
        [
          new FloatingActionButton
          (
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.loop, color: Colors.yellow),
          ),
          new Padding(padding: new EdgeInsets.only(right: 8.0)),
          new FloatingActionButton
          (
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.close, color: Colors.red),
          ),
          new Padding(padding: new EdgeInsets.only(right: 8.0)),
          new FloatingActionButton
          (
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.favorite, color: Colors.green),
          ),
          new Padding(padding: new EdgeInsets.only(right: 8.0)),
          new FloatingActionButton
          (
            mini: true,
            onPressed: () {},
            backgroundColor: Colors.white,
            child: new Icon(Icons.star, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
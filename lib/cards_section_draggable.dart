import 'package:flutter/material.dart';
import 'profile_card_draggable.dart';

class CardsSectionDraggable extends StatefulWidget
{
  @override
  _CardsSectionState createState() => new _CardsSectionState();
}

class _CardsSectionState extends State<CardsSectionDraggable>
{
  bool dragOverTarget = false;
  List<ProfileCardDraggable> cards = new List();
  int cardsCounter = 0;

  @override
  void initState()
  {
    super.initState();

    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++)
    {
      cards.add(new ProfileCardDraggable(cardsCounter));
    }
  }

  @override
  Widget build(BuildContext context)
  {
    return new Expanded
    (
      child: new Stack
      (
        children: <Widget>
        [
          // Drag target row
          new Row
          (
            mainAxisSize: MainAxisSize.max,
            children: <Widget>
            [
              dragTarget(),
              new Flexible
              (
                flex: 2,
                child: new Container()
              ),
              dragTarget()
            ],
          ),
          // Back card
          new Align
          (
            alignment: new Alignment(0.0, 1.0),
            child: new IgnorePointer(child: new SizedBox.fromSize
            (
              size: new Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.5),
              child: cards[2],
            )),
          ),
          // Middle card
          new Align
          (
            alignment: new Alignment(0.0, 0.8),
            child: new IgnorePointer(child: new SizedBox.fromSize
            (
              size: new Size(MediaQuery.of(context).size.width * 0.85, MediaQuery.of(context).size.height * 0.55),
              child: cards[1],
            )),
          ),
          // Front card
          new Align
          (
            alignment: new Alignment(0.0, 0.0),
            child: new Draggable
            (
              feedback: new SizedBox.fromSize
              (
                size: new Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.6),
                child: cards[0],
              ),
              child: new SizedBox.fromSize
              (
                size: new Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.6),
                child: cards[0],
              ),
              childWhenDragging: new Container(),
            ),
          ),
        ],
      )
    );
  }

  void changeCardsOrder()
  {
    setState(()
    {
      // Swap cards
      var temp = cards[0];
      cards[0] = cards[1];
      cards[1] = cards[2];
      cards[2] = temp;

      cards[2] = new ProfileCardDraggable(cardsCounter);
      cardsCounter++;
    });
  }

  Widget dragTarget()
  {
    return new Flexible
    (
      flex: 1,
      child: new DragTarget
      (
        builder: (_, __, ___)
        {
          return new Container();
        },
        onWillAccept: (_)
        {
          setState(() => dragOverTarget = true);
          return true;
        },
        onAccept: (_)
        {
          changeCardsOrder();
          setState(() => dragOverTarget = false);
        },
        onLeave: (_) => setState(() => dragOverTarget = false)
      ),
    );
  }
}
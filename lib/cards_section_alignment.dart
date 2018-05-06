import 'package:flutter/material.dart';
import 'profile_card.dart';
import 'dart:math';

class CardsSectionAlignment extends StatefulWidget
{
  @override
  _CardsSectionState createState() => new _CardsSectionState();
}

class _CardsSectionState extends State<CardsSectionAlignment>
{
  bool dragOverTarget = false;
  List<ProfileCard> cards = new List();
  int cardsCounter = 0;

  final Alignment backCardAlign = new Alignment(0.0, 0.8);
  final Alignment middleCardAlign = new Alignment(0.0, 0.55);
  final Alignment defaultFrontCardAlign = new Alignment(0.0, 0.0);
  Alignment frontCardAlign = new Alignment(0.0, 0.0);

  double frontCardRot = 0.0;

  @override
  void initState()
  {
    super.initState();

    for (cardsCounter = 0; cardsCounter < 3; cardsCounter++)
    {
      cards.add(new ProfileCard(cardsCounter));
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
          // Back card
          new Align
          (
            alignment: backCardAlign,
            child: new IgnorePointer(child: new SizedBox.fromSize
            (
              size: new Size(MediaQuery.of(context).size.width * 0.8, MediaQuery.of(context).size.height * 0.5),
              child: cards[2],
            )),
          ),
          // Middle card
          new Align
          (
            alignment: middleCardAlign,
            child: new IgnorePointer(child: new SizedBox.fromSize
            (
              size: new Size(MediaQuery.of(context).size.width * 0.85, MediaQuery.of(context).size.height * 0.55),
              child: cards[1],
            )),
          ),
          // Front card
          new Align
          (
            alignment: frontCardAlign,
            child: new SizedBox.fromSize
            (
              size: new Size(MediaQuery.of(context).size.width * 0.9, MediaQuery.of(context).size.height * 0.6),
              child: new Transform.rotate
              (
                angle: (pi / 180.0) * frontCardRot,
                child: cards[0],
              ),
            ),
          ),
          new SizedBox.expand
          (
            child: new GestureDetector
            (
              // While dragging the first card
              onPanUpdate: (DragUpdateDetails details)
              {
                // Add what the user swiped in the last frame to the alignment of the card
                setState(()
                {
                  // 20 is the "speed" at which moves the card
                  frontCardAlign = new Alignment
                  (
                    frontCardAlign.x + 20 * details.delta.dx / MediaQuery.of(context).size.width,
                    frontCardAlign.y + 20 * details.delta.dy / MediaQuery.of(context).size.height
                  );
                  
                  frontCardRot = frontCardAlign.x /* * rotation speed */;
                });
              },
              // When releasing the first card
              onPanEnd: (_)
              {
                // If the front card was swiped far enough to count as swiped
                if(frontCardAlign.x > 3.0 || frontCardAlign.x < -3.0)
                {
                  changeCardsOrder();
                }

                // Return to the initial rotation and alignment
                setState(()
                {
                  frontCardAlign = defaultFrontCardAlign;
                  frontCardRot = 0.0;
                });
              },
            )
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

      cards[2] = new ProfileCard(cardsCounter);
      cardsCounter++;
    });
  }
}
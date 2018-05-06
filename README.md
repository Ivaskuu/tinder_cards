# Tinder cards

Hi! After showcasing [Focus for Reddit](https://play.google.com/store/apps/details?id=com.skuu.focusreddit), the app I am working on, people asked me how did I do the tinder like cards swipe (posts media are shown as a stack of 3 swipable cards) and if I could make tutorial or open-source it:

![Focus for Reddit preview](https://i.imgur.com/vVyY7O5.gif)

And I did it! Here it is. I've created a Tinder like user interface (not working, that's not the point).

![Focus for Reddit preview](https://i.imgur.com/PM9AhLX.gif)

I've found 2 ways of doing this (there may be way more ways)
 - Using Draggable
 - Using GestureDetector and Alignment (what I use for my app)

P.S: Use the appBar switch to go from Draggable cards section to GestureDetector and Alignment cards section.

# Draggable
This technique uses the already implemented drag system in Flutter. It's also pretty easy to set up:
 - Stack
   - Row with DragTargets
   - IgnorePointer with ProfileCard (IgnorePointer so the top card Draggable touches the DragTarget)
   - IgnorePointer with ProfileCard
   - Draggable with ProfileCard

How does this work? Well, when the Draggable is dragged by the user, if there's a DragTest widget under the finger, it will execute the DragTest onWillAccept function, or onAccept if the card is released over. Also, when released, it will return to the default position, then call changeCardsOrder() which moves the cards by 1 and creates a new ProfileCard for the last card.

The problem with this technique is that you can't get the Draggable position while it is being swiped. So when released it will pop to the default position, and the return movement can't be animated (or going off the screen like in my app). Another problem (for me) is that you can't update the Draggable while it is swiped. It stays the same as when the user started dragging, and setState() takes effect only after being released. So, no way to slightly rotate the card while it is moving (which was very important for me).

# Gesture detector and Alignment
As cards are placed in a Stack, each of them needs an Align widget to specify it's position in the stack. In this technique, a DragTarget is placed over the Stack.
The user thinks he is swiping the front card but in reality he is just triggering the onPanUpdate() function of the GestureDetector. The amount the finger moves each frame is added to the Alignment of the front card, modified by a speed constant (otherwise the card would go too fast or too slow).
The card rotation is then calculated based on the front card x alignment. On finger release, if the card alignment.x is bigger than a certain value, the swipe is considered valid and changeCardsOrder() is called.
 - Stack
   - ProfileCard
   - ProfileCard
   - ProfileCard
   - GestureDetector
  
## How animation works
// TODO

<hr>

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).
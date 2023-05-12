import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:flip_card/flip_card.dart';
import '../../domain/flashcard.dart';
import '../widgets/flashcard_view.dart';

class FlashcardLearnScreen extends StatefulWidget {
  const FlashcardLearnScreen({super.key});

  @override
  State<FlashcardLearnScreen> createState() => _FlashcardLearnScreenState();
}

class _FlashcardLearnScreenState extends State<FlashcardLearnScreen> {
  List<Flashcard> _flashcards = [
    Flashcard(word: "question 1", definition: "answer 1"),
    Flashcard(word: "question 2", definition: "answer 2"),
    Flashcard(word: "question 3", definition: "answer 3"),
    Flashcard(word: "question 4", definition: "answer 4"),
  ];

  bool _left = true;
  bool _right = false;
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  void _increaseIndex() {
    setState(() {
      if (_index == _flashcards.length - 2) {
        _right = true;
      }
      _left = false;
      _index =
          (_index++ < _flashcards.length) ? _index++ : _flashcards.length - 1;
    });
  }

  void _decreaseIndex() {
    setState(() {
      if (_index == 1) {
        _left = true;
      }
      _right = false;
      _index = (_index-- >= 0) ? _index-- : _flashcards.length--;
    });
  }

  int _cardNumber() {
    int newIndex = _index;
    return ++newIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded, color: primaryColor,),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
        title: Text(
          "${_cardNumber()} / ${_flashcards.length}",
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ------------------------ FLASHCARD ------------------------
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: SizedBox(
                width: 360,
                height: 450,
                child: FlipCard(
                  speed: 550,
                  front: FlashcardView(text: _flashcards[_index].word),
                  back: FlashcardView(text: _flashcards[_index].definition),
                ),
              ),
            ),
      
            // ------------------------ SWITCH CARDS ------------------------
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_left)
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.chevron_left),
                      tooltip: 'Previous card',
                    )
                  else
                    IconButton(
                      onPressed: _decreaseIndex,
                      icon: const Icon(Icons.chevron_left),
                      tooltip: 'Previous card',
                    ),
                  Text(
                    'Tap the card to flip',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  if (_right)
                    const IconButton(
                      onPressed: null,
                      icon: Icon(Icons.chevron_right),
                      tooltip: 'Previous card',
                    )
                  else
                    IconButton(
                      onPressed: _increaseIndex,
                      icon: const Icon(Icons.chevron_right),
                      tooltip: 'Previous card',
                    ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class MyAction extends Action<MyIntent> {
  @override
  void addActionListener(ActionListenerCallback listener) {
    super.addActionListener(listener);
    debugPrint('Action Listener was added');
  }

  @override
  void removeActionListener(ActionListenerCallback listener) {
    super.removeActionListener(listener);
    debugPrint('Action Listener was removed');
  }

  @override
  void invoke(covariant MyIntent intent) {
    notifyActionListeners();
  }
}

class MyIntent extends Intent {
  const MyIntent();
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return const FlashcardLearnScreen();
  }
}

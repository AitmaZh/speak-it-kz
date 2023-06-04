import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:speak_it_kz/network_handler.dart';
import '../../domain/flashcard.dart';
import '../widgets/flashcard_view.dart';
import 'package:http/http.dart' as http;

class FlashcardLearnScreen extends StatefulWidget { 
  final String id;

  FlashcardLearnScreen({required this.id});

  @override
  State<FlashcardLearnScreen> createState() => _FlashcardLearnScreenState();
}

class _FlashcardLearnScreenState extends State<FlashcardLearnScreen> {
  NetworkHandler networkHandler = NetworkHandler();
  
  List<dynamic> flashcards = [
    Flashcard(
        word: "definition['word']", definition: "definition['description']"),
    Flashcard(
        word: "definition['word']", definition: "definition['description']")
  ];

  fetchDefinitions() async {
    var url = '${networkHandler.baseUrl}/topics/definitions/${widget.id}';
    var response = await http.get(Uri.parse(url)); 
    if (response.statusCode == 200 || response.statusCode == 201) {
      flashcards.removeAt(0);

      var data = json.decode(response.body); 

      data.forEach((definition) {
        setState(() {
          flashcards.add(Flashcard(
              word: definition['word'], definition: definition['description'])); 
        });
      });
      flashcards.removeAt(0);
    }
  }

  bool _left = true;
  bool _right = false;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    fetchDefinitions();
  }

  void _increaseIndex() {
    setState(() {
      if (_index == flashcards.length - 2) {
        _right = true;
      }
      _left = false;
      _index =
          (_index++ < flashcards.length) ? _index++ : flashcards.length - 1;
    });
  }

  void _decreaseIndex() {
    setState(() {
      if (_index == 1) {
        _left = true;
      }
      _right = false;
      _index = (_index-- >= 0) ? _index-- : flashcards.length--;
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
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
        title: Text(
          "${_cardNumber()} / ${flashcards.length}",
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
                  front: FlashcardView(text: flashcards[_index].word),
                  back: FlashcardView(text: flashcards[_index].definition),
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
                      tooltip: 'Next card',
                    )
                  else
                    IconButton(
                      onPressed: _increaseIndex,
                      icon: const Icon(Icons.chevron_right),
                      tooltip: 'Next card',
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
    return FlashcardLearnScreen(id: 'id');
  }
}

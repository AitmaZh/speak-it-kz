import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';

import '../widgets/set_cards.dart';

class FlashcardHomeScreen extends StatelessWidget {
  FlashcardHomeScreen({super.key});

  List<Widget> _gridItems = [
    SetCard(
      setName: 'Set1',
      setLevel: 'A1',
    ),
    SetCard(
      setName: 'Set2',
      setLevel: 'A1',
    ),
    SetCard(
      setName: 'Set3',
      setLevel: 'A1',
    ),
    SetCard(
      setName: 'Set4',
      setLevel: 'A1',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(
          'Flashcards',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: GridView.count(
            crossAxisCount: 2,
            children: _gridItems,
          ),
        ),
      ),
    );
  }
}

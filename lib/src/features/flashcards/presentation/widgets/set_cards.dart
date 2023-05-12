import 'package:flutter/material.dart';
import 'package:speak_it_kz/assets/my_colors.dart';
import 'package:speak_it_kz/src/features/flashcards/presentation/pages/flashcard_learn_page.dart';

class SetCard extends StatelessWidget {
  dynamic setName;
  dynamic setLevel;

  SetCard({required this.setName, required this.setLevel});

  @override
  Widget build(BuildContext context) {
    setCardTapped() {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FlashcardLearnScreen()));
    }

    return Card(
      child: InkWell(
        splashColor: secondaryColor.shade200,
        onTap: setCardTapped,
        child: SizedBox(
          width: 300,
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  setName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              Text(
                setLevel,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}

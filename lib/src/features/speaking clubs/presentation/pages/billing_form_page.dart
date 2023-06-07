import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../../assets/my_colors.dart';

class BillingFormScreen extends StatelessWidget {
  const BillingFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: primaryColor,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Pay with a Credit Card',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        backgroundColor: transparentColor,
        shadowColor: transparentColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Text('Please enter the card information below.'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: CardFormField(
                  style: CardFormStyle(borderColor: primaryColor),
                  controller: CardFormEditController(),
                  enablePostalCode: false,
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Pay')),
            ],
          ),
        ),
      ),
    );
  }
}
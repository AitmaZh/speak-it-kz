import 'package:flutter/material.dart';

class ProfileNavigator extends StatelessWidget {
  const ProfileNavigator({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => print('secondary button pressed'),
      borderRadius: BorderRadius.circular(30),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.timer, size: 30,),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text('Buttin', style: Theme.of(context).textTheme.bodySmall),),
          ],
        ),
      ),
    );
  }
}

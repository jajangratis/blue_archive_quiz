import 'package:blue_archive_quiz/main.dart';
import 'package:flutter/material.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
    return IconButton(
    icon: const Icon(Icons.arrow_back),
    onPressed: () {
      // MyApp
      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => const MyApp()));
      // Navigator.canPop(context) ? Navigator.pop(context) : null;// Pop the current screen from the stack
    });
  }
}
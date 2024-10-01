import 'package:blue_archive_quiz/about_screen.dart';
import 'package:blue_archive_quiz/components/title_text.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/Blue_Archive_EN_logo.png',
            width: 300,
            // color: const Color.fromARGB(86, 64, 123, 200),
          ),
          const SizedBox(
            height: 80,
          ),
          const TitleText(input: 'Quiz tentang Blue Archive'),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right),
            label: const Text('Start Quiz!'),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const AboutScreen()));
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.question_answer_outlined),
            label: const Text('About Quiz!'),
          ),
        ],
      ),
    ));
  }
}

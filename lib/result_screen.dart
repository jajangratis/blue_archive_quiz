import 'package:blue_archive_quiz/about_screen.dart';
import 'package:blue_archive_quiz/data/questions.dart';
import 'package:blue_archive_quiz/question_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;

  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i],
        'question_image': questions[i].images
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['correct_answer'] == data['user_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                textAlign: TextAlign.center,
                "Kerja Bagus! $numCorrectQuestions out $numTotalQuestions Dijawab dengan benar",
                style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 56, 133, 241),
                    fontSize: 24,
                    fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            QuestionSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromRGBO(255, 255, 255, 1),
              ),
              icon: const Icon(Icons.loop_sharp),
              label: const Text('Restart Quiz!'),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
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
      ),
    );
  }
}

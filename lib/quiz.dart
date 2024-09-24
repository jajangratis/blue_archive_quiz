import 'package:blue_archive_quiz/data/questions.dart';
import 'package:blue_archive_quiz/question_screen.dart';
import 'package:blue_archive_quiz/result_screen.dart';
import 'package:flutter/material.dart';

import 'package:blue_archive_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswer = [];

  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
      selectedAnswer = [];
    });
  }

  void chooseAnswer(String asnwer) {
    selectedAnswer.add(asnwer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
        // selectedAnswer = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);


    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(onSelectAnswer: chooseAnswer); 
    } 
    if (activeScreen == 'results-screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswer, onRestart: switchScreen);
    }
      
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft,
                colors: [
                Color.fromARGB(255, 255, 255, 255),
                Color.fromARGB(255, 81, 83, 181),
              ]),
            ),
          child:  screenWidget,
        ),
      ),
    );
  }
}
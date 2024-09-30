import 'package:blue_archive_quiz/components/title_text.dart';
import 'package:blue_archive_quiz/data/questions.dart';
import 'package:blue_archive_quiz/question_screen.dart';
import 'package:blue_archive_quiz/result_screen.dart';
import 'package:flutter/material.dart';

import 'package:blue_archive_quiz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz(Null Function() param0, {super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  // ignore: prefer_typing_uninitialized_variables
  var backButton;
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
        backButton = null;
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
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 139, 193, 237),
          centerTitle: false,
        ),
        body: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 139, 193, 237)
            ),
          child:  screenWidget,
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:revmed/components/Answer_button.dart';
import 'package:revmed/components/timer.dart';
import 'package:revmed/data/questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final currentQuestion = questions[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/whiteBackground.png'),
                fit: BoxFit.fill)),
        child: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.question,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 30),
              ...currentQuestion.getShuffledAnswers().map((answer) {
                return AnswerButton(
                  answerText: answer,
                  onTap: () {},
                );
              }),
              //TimerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

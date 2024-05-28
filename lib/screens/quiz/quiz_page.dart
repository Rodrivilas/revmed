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
  var currentQuestionIndex = 0;
  final List<String> selectedAnswers = [];
  var answeredQuestions = [];
  answerQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.pop(context);
    }
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    answeredQuestions.add(currentQuestion);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/whiteBackground.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    onTap: () {
                      answerQuestion();
                    },
                  );
                }),
                IconButton(
                    onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    const SizedBox(height: 15),
                                    Text(currentQuestion.help),
                                    const SizedBox(height: 15),
                                    Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text('Cerrar'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                    icon: const Icon(Icons.question_mark)),
                TimerWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

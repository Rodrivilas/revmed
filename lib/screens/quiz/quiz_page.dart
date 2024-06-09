import 'package:flutter/material.dart';
import 'package:revmed/components/answer_checkbox.dart';
import 'package:revmed/components/timer.dart';
import 'package:revmed/data/questions.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var currentQuestionIndex = 0;

  bool checkedValue = true;
  answerQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/whiteBackground.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Questionário",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    currentQuestion.question,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const TimerWidget(),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            backgroundColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            context: context,
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 25, horizontal: 15),
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(currentQuestion.help),
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
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.question_mark)),
                  ],
                ),
                ...currentQuestion.getShuffledAnswers().map((answer) {
                  return AnswerCheckbox(title: answer);
                }),
//.............................
              ],
            ),
          ),
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('Termina'),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:revmed/components/custom_switch.dart';
import 'package:revmed/screens/quiz/quiz_page.dart';

class QuizSelectionPage extends StatefulWidget {
  const QuizSelectionPage({super.key});

  @override
  State<QuizSelectionPage> createState() => _QuizSelectionPage();
}

class _QuizSelectionPage extends State<QuizSelectionPage> {
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 200.ms)],
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/whiteBackground.png'),
                fit: BoxFit.cover)),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Selecione a Categoria',
                    style:
                        TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 10),
                  const CustomSwitch(text: 'Preventiva'),
                  const CustomSwitch(text: 'Pediatria'),
                  const CustomSwitch(text: 'Cirugia'),
                  const CustomSwitch(text: 'Clínica Médica'),
                  const CustomSwitch(text: 'Ginecologia e Obstetrícia'),
                  const SizedBox(height: 15),
                  const Text(
                    'Selecione a dificuldade',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 15),
                  ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        isSelected[index] = !isSelected[index];
                      });
                    },
                    selectedColor: Colors.white,
                    fillColor: Theme.of(context).primaryColor,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    constraints: const BoxConstraints(
                      minHeight: 40.0,
                      minWidth: 100.0,
                    ),
                    isSelected: isSelected,
                    children: const [
                      Text("Fácil"),
                      Text("Moderado"),
                      Text("Dificil"),
                    ],
                  ),
                  const SizedBox(height: 30),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const QuizPage()));
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                      padding: const EdgeInsets.all(13),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    icon: const Icon(Icons.play_arrow),
                    label: const Text('Iniciar quiz'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

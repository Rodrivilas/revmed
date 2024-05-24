import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:revmed/components/constants.dart';
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
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/whiteBackground.png'),
              fit: BoxFit.fill)),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 160),
            const CustomSwitch(text: 'Preventiva'),
            const SizedBox(height: 10),
            const CustomSwitch(text: 'Pediatria'),
            const SizedBox(height: 10),
            const CustomSwitch(text: 'Cirugia'),
            const SizedBox(height: 10),
            const CustomSwitch(text: 'Clínica Médica'),
            const SizedBox(height: 10),
            const CustomSwitch(text: 'Ginecologia e Obstetrícia'),
            const SizedBox(height: 60),
            ToggleButtons(
              onPressed: (int index) {
                setState(() {
                  isSelected[index] = !isSelected[index];
                });
              },
              selectedColor: Colors.white,
              fillColor: const Color.fromARGB(255, 253, 152, 8),
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
            const SizedBox(height: 60),
            TextButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const QuizPage()));
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
                backgroundColor: primary,
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text('Iniciar quiz'),
            ),
          ],
        ),
      ),
    );
  }
}

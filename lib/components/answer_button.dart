import 'package:flutter/material.dart';
import 'package:revmed/components/constants.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
              backgroundColor: const Color.fromARGB(224, 255, 255, 255),
              foregroundColor: primary,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
          child: Text(
            answerText,
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}

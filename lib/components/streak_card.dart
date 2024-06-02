import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({
    super.key,
    required this.streak,
  });

  final String streak;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).cardColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Parabéns", style: TextStyle(fontSize: 20)),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(streak,
                    style: GoogleFonts.comfortaa(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 10),
                  child: Text("dias no app!",
                      style: TextStyle(
                        fontSize: 28,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

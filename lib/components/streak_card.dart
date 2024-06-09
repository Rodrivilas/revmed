import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:revmed/my_flutter_app_icons.dart';

class StreakCard extends StatelessWidget {
  const StreakCard({
    super.key,
    required this.streak,
  });

  final String streak;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).primaryColor, width: 2.0),
          borderRadius: BorderRadius.circular(20.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6, right: 4),
                    child: Icon(
                      CustomIcons.stats,
                      size: 28,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Text(
                    streak,
                    style: GoogleFonts.comfortaa(
                        fontSize: 34, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const Text("Responda às perguntas para iniciar no streak",
                style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

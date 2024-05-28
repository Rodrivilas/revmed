import 'package:flutter/material.dart';
import 'package:revmed/components/constants.dart';

class StatCard extends StatelessWidget {
  const StatCard(
      {super.key,
      required this.titleText,
      required this.statText,
      required this.cardIcon});
  final String titleText;
  final String statText;
  final IconData cardIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(214, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 22),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(titleText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  )),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(18.0),
                      child: Icon(
                        cardIcon,
                        color: primary,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(statText,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

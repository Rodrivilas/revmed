import 'package:flutter/material.dart';

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
      color: Theme.of(context).cardColor,
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
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Icon(
                        cardIcon,
                        color: Theme.of(context).primaryColor,
                        size: 22,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(statText,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

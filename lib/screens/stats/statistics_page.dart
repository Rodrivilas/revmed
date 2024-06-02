import 'package:flutter/material.dart';
import 'package:revmed/components/stat_card.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/whiteBackgroundAlt.png'),
                fit: BoxFit.fill)),
        child: Container(
          margin: const EdgeInsets.all(15),
          child: const Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      'Desempenho nos estudos',
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.normal),
                    ),
                  ),
                  StatCard(
                    titleText: 'Tempo estudando',
                    statText: '20h 30m',
                    cardIcon: Icons.access_alarm,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: StatCard(
                          titleText: 'Aceito',
                          statText: '20',
                          cardIcon: Icons.check,
                        ),
                      ),
                      Expanded(
                        child: StatCard(
                          titleText: 'Erros',
                          statText: '20',
                          cardIcon: Icons.close,
                        ),
                      ),
                    ],
                  ),
                  StatCard(
                    titleText: 'Total de perguntas respondidas',
                    statText: '20 perguntas',
                    cardIcon: Icons.done_all,
                  ),
                  StatCard(
                    titleText: 'Streak no aplicativo',
                    statText: '209 dias',
                    cardIcon: Icons.fireplace_outlined,
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

import 'package:flutter/material.dart';
import 'package:revmed/my_flutter_app_icons.dart';
import 'package:revmed/theme/color_scheme.dart';
import 'package:revmed/screens/home/home.dart';
import 'package:revmed/screens/quiz/quiz_selection_page.dart';
import 'package:revmed/screens/stats/statistics_page.dart';

class HomeNavBar extends StatefulWidget {
  const HomeNavBar({super.key});

  @override
  State<HomeNavBar> createState() => _BottomNavigationBar();
}

class _BottomNavigationBar extends State<HomeNavBar> {
  int _selectedIndex = 1;
  static final List<Widget> _widgetOptions = <Widget>[
    const StatisticsPage(),
    const HomePage(),
    const QuizSelectionPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        iconSize: 18,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.stats,
            ),
            label: 'Rendimento',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CustomIcons.quiz,
            ),
            label: 'Questões',
          ),
        ],
        currentIndex: _selectedIndex,
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).disabledColor,
        selectedItemColor: primary,
        onTap: _onItemTapped,
      ),
    );
  }
}

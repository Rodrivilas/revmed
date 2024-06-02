import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    const StatisticsPage(),
    const QuizSelectionPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).cardColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Rendimento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
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

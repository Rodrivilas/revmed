import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:revmed/screens/auth/auth_menu.dart';
import 'package:revmed/screens/home_nav_bar.dart';

class UserHandler extends StatelessWidget {
  const UserHandler({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomeNavBar();
          } else {
            return const AuthMenu();
          }
        },
      ),
    );
  }
}

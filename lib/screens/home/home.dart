import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = FirebaseAuth.instance.currentUser!;

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/revmedLogo.png',
          width: 30,
        ),
        actions: [
          IconButton(
              onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text('Tem certeza que deseja sair?'),
                            const SizedBox(height: 15),
                            Center(
                              child: Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      logOut();
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Fechar Sessão'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancelar'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text("Welcome ${user.email!}"),
          Image.asset(
            'assets/images/revmedLogo.png',
            width: 30,
          )
        ]),
      ),
    );
  }
}

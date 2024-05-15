import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:revmed/screens/auth/login_page.dart';

//
class AuthMenu extends StatelessWidget {
  const AuthMenu({super.key});

  void signGoogle() async {
    final googleAccount = await GoogleSignIn().signIn();

    final googleAuth = await googleAccount?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 80),
              Image.asset(
                'assets/images/revmedLogo.png',
                width: 80,
              ),
              const SizedBox(height: 20),
              const Text(
                'REVMED te dá as boas-vindas',
                style: TextStyle(
                  color: Color.fromARGB(255, 253, 152, 8),
                  fontSize: 24,
                ),
              ),

              const SizedBox(height: 360),
              
              Container(
                margin: const EdgeInsets.only(right: 35, left: 35),
                child: Column(children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                      padding: const EdgeInsets.all(13),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      backgroundColor: const Color.fromARGB(255, 253, 152, 8),
                    ),
                    icon: const Icon(Icons.face),
                    label: const Text('Entrar com CPF'),
                  ),
                  

                  const SizedBox(height: 10),
                  

                  TextButton.icon(
                    onPressed: signGoogle,
                    style: OutlinedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40),
                      padding: const EdgeInsets.all(15),
                      foregroundColor: Colors.black,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    icon: Image.asset(
                      'assets/images/google.png',
                      width: 20,
                    ),
                    label: const Text('Continuar com o Google'),
                  ),
                ]),
              ),

              const SizedBox(height: 30),
              
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ainda não tem uma conta',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Cadastre-se',
                    style: TextStyle(
                      color: Color.fromARGB(255, 253, 152, 8),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:revmed/theme/color_scheme.dart';
import 'package:revmed/components/text_field.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Future signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return const Center(
          child: CircularProgressIndicator(
            color: primary,
          ),
        );
      },
    );

    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/whiteBackground.png'),
                fit: BoxFit.fill)),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                Image.asset(
                  'assets/images/revmedLogo.png',
                  width: 80,
                ),

                const SizedBox(height: 30),

                const Text(
                  'Bem-vindo, faça login na sua conta agora.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 55),

                MyTextField(
                  controller: emailController,
                  hintText: 'e-mail',
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),

                const SizedBox(height: 10),

                MyTextField(
                  controller: passwordController,
                  hintText: 'Senha',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),

                const SizedBox(height: 10),

                // change pass?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Esqueceu sua senha?',
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 55),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(children: [
                    TextButton(
                      onPressed: () async {
                        try {
                          await signUserIn();

                          Navigator.pop(context);
                        } on FirebaseAuthException catch (error) {
                          print(error.message);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            error.message ?? "Something went wrong",
                          )));
                        } catch (error) {
                          print(error);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            error.toString(),
                          )));
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(40),
                        padding: const EdgeInsets.all(20),
                        foregroundColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        backgroundColor: primary,
                      ),
                      child: const Text('Entrar'),
                    ),
                  ]),
                ),

                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

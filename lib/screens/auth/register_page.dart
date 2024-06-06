import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:revmed/theme/color_scheme.dart';
import 'package:revmed/components/text_field.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  Future signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pop(true);
        });
        return const Center(
          child: CircularProgressIndicator(
            color: primary,
          ),
        );
      },
    );

    if (passwordController.text == confirmPasswordController.text &&
        passwordController.text != '') {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        'Digite uma senha válida.',
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/whiteBackgroundAlt.png'),
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
                  'Bem-vindo, crie sua conta aqui por favor.',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 35),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Nome de usuário',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: nameController,
                  hintText: 'Nome',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: lastNameController,
                  hintText: 'Sobrenome',
                  obscureText: false,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(height: 10),
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
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirmar Senha',
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 45),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(children: [
                    TextButton(
                      onPressed: () async {
                        try {
                          await signUserUp();

                          Navigator.pop(context);
                        } on FirebaseAuthException catch (error) {
                          print(error.message);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            error.message ?? "Something went wrong",
                          )));
                        } on RecaptchaVerifierOnError catch (error) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(
                            error.toString(),
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
                      child: const Text('Registrar'),
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

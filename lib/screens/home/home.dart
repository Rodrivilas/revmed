import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:revmed/components/contact_widget.dart';
import 'package:revmed/components/home_image_card.dart';
import 'package:revmed/components/streak_card.dart';
import 'package:revmed/services/notification_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = FirebaseAuth.instance.currentUser!;
  var today = DateTime.now();

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
    await GoogleSignIn().signOut();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [FadeEffect(duration: 200.ms)],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).cardColor,
          title: Image.asset(
            'assets/images/revmedLogo.png',
            width: 30,
          ),
          actions: [
            Animate(
              effects: const [ShakeEffect()],
              child: IconButton(
                  onPressed: () {
                    NotificationService().showNotification(
                        title: 'Estudia', body: 'Filho da puta');
                  },
                  icon: const Icon(Icons.notifications)),
            ),
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            actions: [
                              TextButton(
                                onPressed: () {
                                  logOut();
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Fechar Sessão"),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cancelar")),
                            ],
                            title: const Text("Tem certeza que deseja sair?"),
                            contentPadding: const EdgeInsets.all(20),
                          ));
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash_background.png'),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Bem-vindo ",
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Theme.of(context).primaryColor),
                              ),
                              Text(
                                user.email.toString(),
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.settings))
                      ],
                    ),
                    const SizedBox(height: 25),
                    const HomeCard(),
                    const SizedBox(height: 25),
                    Animate(
                        effects: const [ShimmerEffect()],
                        child: const StreakCard(streak: "0")),
                    const SizedBox(height: 25),
                    const Text(
                      "Contate-nos",
                      style: TextStyle(
                        fontSize: 22,
                      ),
                    ),
                    const ContactWidget(),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

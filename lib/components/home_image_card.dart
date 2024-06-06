import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: NetworkImage(
              "https://images.pexels.com/photos/20522325/pexels-photo-20522325/free-photo-of-pier-at-the-beach.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
          fit: BoxFit.cover,
        ),
      ),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "La bebe bebe lechefsdfsdfsdffsdsdfgggggggggggggggggggg gggggssssssssssss",
              textAlign: TextAlign.center,
            ),
            Text(
              "-Rotis",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

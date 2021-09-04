import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ContactDoctor extends StatelessWidget {
  const ContactDoctor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Lottie.asset('images/soon1.json', height: 180),
            SizedBox(
              height: 20,
            ),
            Text(
              'Stay Tuned',
              style: TextStyle(
                fontSize: 28,
                fontFamily: 'Circular',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

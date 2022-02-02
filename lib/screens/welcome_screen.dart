import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:plant_disease/components/rounded_button.dart';
import 'package:plant_disease/constant.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myAccentColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget> [
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'PLANT',
                  style: TextStyle(
                    color: mySecondaryColor,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const Text(
                  ' DISEASE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.w900,
                  ),
                )
              ]),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                color: Colors.blueAccent[400],
                textColor: Colors.white,
                title: 'Log in',
                function: () {
              Navigator.pushNamed(context, LoginScreen.id);
            }),
            RoundedButton(
                color: Colors.blueAccent[400],
                textColor: Colors.white,
                title: 'Register',
                function: () {
              Navigator.pushNamed(context, RegistrationScreen.id);
            }),
          ],
        ),
      ),
    );
  }
}

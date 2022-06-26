import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:plant_disease/components/rounded_button.dart';
import 'package:plant_disease/constant.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);
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
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                'PLANT',
                style: TextStyle(
                  color: mySecondaryColor,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                ' DISEASE',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                ),
              )
            ]),
            const SizedBox(
              height: 48.0,
            ),
            RoundedButton(
                corner: BorderRadius.circular(10.0),
                color: Colors.blueAccent[400],
                textColor: Colors.white,
                title: 'Log in',
                function: () {
                  Navigator.pushNamed(context, LoginScreen.id);
                }),
            RoundedButton(
                corner: BorderRadius.circular(10.0),
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

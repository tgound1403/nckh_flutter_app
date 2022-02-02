import 'package:flutter/material.dart';
import 'package:plant_disease/constant.dart';
import 'package:plant_disease/components/rounded_button.dart';
import 'package:plant_disease/screens/user_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String email='';
  String password = '';
  String username = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myAccentColor,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            const SizedBox(height: 48,),
            Material(
              elevation: 5,
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Username',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),),
                    const SizedBox(height:4),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        textAlign: TextAlign.center,
                        decoration: kTextFieldDecoration,
                    ),
                    const SizedBox(height:8),

                    const Text('Email',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                      fontSize: 14,
                          fontWeight: FontWeight.bold

                      ),),
                    const SizedBox(height:4),
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecoration
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text(
                      'Password',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),),
                    const SizedBox(height: 4,),
                    TextField(
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                        textAlign: TextAlign.center,
                        decoration: kTextFieldDecoration
                    ),
                    const SizedBox(height:8),
                    const Text('Retype Password',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 14,
                          fontWeight: FontWeight.bold

                      ),),
                    const SizedBox(height:4),
                    TextField(
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          // setState(() {
                          //   email = value;
                          // });
                        },
                        textAlign: TextAlign.center,
                        decoration: kTextFieldDecoration
                    ),
                    const SizedBox(height: 42,),
                    Row(
                      children: [
                        SizedBox(width: 94),
                        RoundedButton(
                            color: myAccentColor,
                            textColor: Colors.green[400],
                            title: 'Register',
                            function: () {
                              Navigator.pushNamed(context, UserScreen.id);
                            }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:plant_disease/constant.dart';
import 'package:plant_disease/components/rounded_button.dart';
import 'home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';

  const RegistrationScreen({Key? key}) : super(key: key);
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late bool showSpinner = false;
  String error = '';
  final _auth = FirebaseAuth.instance;
  late User loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {}
  }

  register() async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) Navigator.pushNamed(context, HomeScreen.id);
      setState(() {
        showSpinner = false;
      });
    } on FirebaseAuthException catch (e) {
      // print(e);
      setState(() {
        showSpinner = false;
        error = '${e.message}';
      });
    }
  }

  String username = '';
  String email = '';
  String password = '';
  String retypePassword = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myAccentColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              ),
              const SizedBox(
                height: 48,
              ),
              Material(
                elevation: 5,
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Username',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
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
                      const SizedBox(height: 8),
                      const Text(
                        'Email*',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        'Password*',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      TextField(
                          obscureText: true,
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration),
                      const SizedBox(height: 8),
                      const Text(
                        'Retype Password*',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      TextField(
                          obscureText: true,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            setState(() {
                              retypePassword = value;
                            });
                          },
                          textAlign: TextAlign.center,
                          decoration: kTextFieldDecoration),
                      const SizedBox(
                        height: 22,
                      ),
                      Text(
                        error,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 94),
                          RoundedButton(
                              corner: BorderRadius.circular(10.0),
                              color: myAccentColor,
                              textColor: Colors.green[400],
                              title: 'Register',
                              function: () async {
                                setState(() {
                                  showSpinner = true;
                                });
                                register();
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
      ),
    );
  }
}

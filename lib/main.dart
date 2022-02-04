import 'package:flutter/material.dart';
// App screen
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/function_screen.dart';
import 'screens/home_screen.dart';
// Firebase use for login and register
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(PlantDisease());
}

class PlantDisease extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: WelcomeScreen.id,
      routes: {
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        FunctionScreen.id: (context) => FunctionScreen()
      },
    );
  }
}

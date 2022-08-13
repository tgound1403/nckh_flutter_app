import 'package:flutter/material.dart';
import 'package:plant_disease/constant.dart';
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

  runApp(const PlantDisease());
}

class PlantDisease extends StatelessWidget {
  const PlantDisease({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: myAccentColor, fontFamily: 'Poppins'),
      initialRoute: HomeScreen.id,
      routes: {
        RegistrationScreen.id: (context) => const RegistrationScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        WelcomeScreen.id: (context) => const WelcomeScreen(),
        FunctionScreen.id: (context) => const FunctionScreen(),
        HomeScreen.id: (context) => const HomeScreen()
      },
    );
  }
}

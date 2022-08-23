import 'package:flutter/material.dart';
import 'package:la_vie/presentation/screens/mobile/regisation_screen.dart';
import 'package:la_vie/presentation/widgets/mobile/global/logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int splashtime = 15;

  void initState() {
    Future.delayed(Duration(seconds: splashtime), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return RegistrationScreen();
      }));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: logo(fontSize: 36),
    );
  }
}

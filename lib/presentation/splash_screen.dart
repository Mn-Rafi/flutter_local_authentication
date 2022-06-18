import 'package:biometric_auth/presentation/home_screen.dart';
import 'package:biometric_auth/repositories/local_auth/local_auth_services.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  LocalAuthServices localAuthServices = LocalAuthServices();

  @override
  void initState() {
    super.initState();
    authenticate();
  }

  void authenticate() async {
    final bool isAvailable = await localAuthServices.authenticate();
    if (isAvailable) {
      localAuthServices.didauthenticated().then((value) {
        if (value) {
          Future.delayed(const Duration(seconds: 3), () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false,
            );
          });
        } else {
          authenticate();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedTextKit(animatedTexts: [
          ColorizeAnimatedText('Lock App',
              speed: const Duration(milliseconds: 2000),
              textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[50]),
              colors: [
                Colors.pink[50]!,
                Colors.red,
                Colors.yellow,
                Colors.green,
                Colors.yellow,
                Colors.green,
                Colors.blue
              ]),
        ]),
      ),
    );
  }
}

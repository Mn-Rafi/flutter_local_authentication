
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:biometric_auth/presentation/custom_widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar('Home'),
      body: Center(
        child: AnimatedTextKit(animatedTexts: [
          ColorizeAnimatedText('Welcome \n Home',
          textAlign: TextAlign.center,
              speed: const Duration(milliseconds: 2000),
              textStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink[50]),
              colors: [
                Colors.pink[300]!,
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

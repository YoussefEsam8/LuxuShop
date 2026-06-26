import 'package:app_fixed/core/constants/strings.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPage();
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, onboarding);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Image(
          image: AssetImage(
            "assets/images/Firefly_Gemini Flash_ظبط الصوره  497184.png",
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

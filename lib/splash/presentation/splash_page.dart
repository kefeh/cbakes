import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(30, 31, 34, 1),
      body: SafeArea(
        child: Center(
          child: Image.asset('assets/images/LGO.png'),
        ),
      ),
    );
  }
}

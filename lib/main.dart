import 'package:flutter/material.dart';

import 'features/splash/presentation/splash_screen.dart';

void main() {
  runApp(const Crypto());
}

class Crypto extends StatelessWidget {
  const Crypto({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto App',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

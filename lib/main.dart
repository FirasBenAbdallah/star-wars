import 'package:flutter/material.dart';

import 'package:think_it/splash.dart';
import 'package:think_it/films.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      routes: {
        "/main": (context) => const Films(),
      },
    );
  }
}

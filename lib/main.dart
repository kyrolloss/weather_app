import 'package:flutter/material.dart';

import 'Screens/Future Screen/Future Screen.dart';
import 'Screens/Splash screen/Splash screen.dart';
import 'Screens/mainLayout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  FutureScreen(),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:local_password/view/fingerprint_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local Authentication',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF183A37),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF183A37),
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const FingerprintView(),
    );
  }
}

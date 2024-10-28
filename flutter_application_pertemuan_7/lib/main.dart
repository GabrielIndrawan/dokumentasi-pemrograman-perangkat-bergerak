import 'package:flutter/material.dart';
import 'package:flutter_application_pertemuan_7/pages/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplikasi Login",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 15)
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const Login(),
    );
  }
}

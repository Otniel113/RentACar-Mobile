import 'package:flutter/material.dart';
import 'login.dart';
import 'home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Login Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(logintitle: _title),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

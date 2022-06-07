import 'package:flutter/material.dart';
import 'views/login.dart';
import 'views/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Rent A Car';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(logintitle: "Login Page"),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

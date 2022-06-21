import 'package:flutter/material.dart';
import 'package:rent_a_car/views/regist.dart';
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
        '/': (context) => LoginScreen(),
        '/regist': (context) => const RegistPage(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}

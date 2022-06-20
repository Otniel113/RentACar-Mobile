import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../models/member.dart';
import '../../../models/mobilbesar.dart';
import 'package:bcrypt/bcrypt.dart';

// Future<List<Member>> fetchMobilBesar(http.Client client) async {
// final response = await client
//     .get(Uri.parse('http://localhost:8000/api/product/mobilbesar'));
// return await compute(parseRegist, response.body);
// }

// List<Member> parseRegist(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<MobilBesar>((json) => MobilBesar.fromJson(json)).toList();
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _Registtitle = 'Regist Page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _Registtitle,
      home: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.red[900], title: const Text(_Registtitle)),
        body: const RegistPage(),
      ),
    );
  }
}

class RegistPage extends StatefulWidget {
  const RegistPage({Key? key}) : super(key: key);

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Rent A Car',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ElevatedButton(
                  child: const Text('Registrasi'),
                  onPressed: () {
                    print(nameController.text);
                    print(emailController.text);
                    print(usernameController.text);
                    print(passwordController.text);
                    register(nameController.text, emailController.text,
                        usernameController.text,passwordController.text);
                    Navigator.pushNamed(context, '/');
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red[900],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

register(String name, email, username,password) async {
  Map data = {
    'name': name,
    'email': email,
    'username': username,
    'password': BCrypt.hashpw(password,BCrypt.gensalt()),
    'created_at': DateTime.now().toString(),
    'updated_at': DateTime.now().toString(),

    // 'Mobile': contact,
    // 'Password': pass,
    // 'RetypePassword': conpass,
  };
  print(data);

  String body = json.encode(data);
  var url = 'http://localhost:8000/api/profile';
  var response = await http.post(
    Uri.parse(url),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    },
  );
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 200) {
    //Or put here your next screen using Navigator.push() method
    print('success');
  } else {
    print('error');
  }
}

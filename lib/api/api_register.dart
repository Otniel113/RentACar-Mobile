import 'dart:convert';
import 'package:http/http.dart' as http;

register(String name, email, username, password) async {
  Map data = {
    'name': name,
    'email': email,
    'username': username,
    'password': password,
    // 'created_at': DateTime.now().toString(),
    // 'updated_at': DateTime.now().toString(),

    // 'Mobile': contact,
    // 'Password': pass,
    // 'RetypePassword': conpass,
  };

  String body = json.encode(data);
  var url = 'http://localhost:8000/api/register';
  var response = await http.post(
    Uri.parse(url),
    body: body,
    headers: {
      "Content-Type": "application/json",
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*"
    },
  );
}
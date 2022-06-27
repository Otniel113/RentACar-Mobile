import 'dart:convert';
import 'package:http/http.dart' as http;

register(String name, email, username, password) async {
  Map data = {
    'name': name,
    'email': email,
    'username': username,
    'password': password,
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
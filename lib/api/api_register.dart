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
  print(data);

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
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 200 || response.statusCode == 201) {
    //Or put here your next screen using Navigator.push() method
    print('success');
  } else {
    print('error');
  }
}
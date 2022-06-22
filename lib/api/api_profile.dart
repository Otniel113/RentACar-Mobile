import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<Map> getMemberbyID(String id) async {
  var response = await http.get(
    Uri.parse("http://localhost:8000/api/" + id),
    headers: {
      'Content-Type': 'application/json',
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );
  var decoded = jsonDecode(response.body);
  print (decoded);
  return decoded;
}
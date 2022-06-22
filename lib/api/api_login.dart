import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../session/session_manager.dart';

Future<void> loginUser(String email, String password) async {
  var response = await http.post(
    Uri.parse("http://localhost:8000/api/login"),
    headers: {
      'Content-Type': 'application/json',
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
    body: jsonEncode({
      'email': email,
      "password": password
    }),
  );
  var decoded = jsonDecode(response.body);
  // print(decoded["status_login"]);
  if (decoded["status_login"] == "Login Berhasil") {
    SessionManager prefs =  SessionManager();
    prefs.setLoginStatus(true);
    prefs.setMemberID(decoded['member_id'].toString());

  } else if (decoded["status_login"] == "Login Gagal") {
    return Future.error("Email atau password salah");
  } else {
    return Future.error("Error" + response.statusCode.toString());
  }
}
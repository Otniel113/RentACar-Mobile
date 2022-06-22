import 'package:http/http.dart' as http;
import 'dart:async';
import '../session/session_manager.dart';

Future<void> logoutUser() async {
  var response = await http.post(
    Uri.parse("http://localhost:8000/api/logout"),
    headers: {
      'Content-Type': 'application/json',
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );
  SessionManager prefs = SessionManager();
  prefs.deleteLoginStatus();
  prefs.deleteMemberID();
}
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import '../models/member.dart';
import '../session/session_manager.dart';

Future<Member> getMemberbyID(String id) async {
  var response = await http.get(
    Uri.parse("http://localhost:8000/api/profile/" + id),
    headers: {
      'Content-Type': 'application/json',
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );
  final decoded = jsonDecode(response.body) as Map<String, dynamic>;
  final get_profile = Member.fromJson(decoded);
  return get_profile;
}

Future <void> editMember(String id, name, email, username, password) async{
  Map data = {
    'name': name,
    'email': email,
    'username': username,
    'password': password,
  };

  String body = json.encode(data);
  var response = await http.put(
      Uri.parse("http://localhost:8000/api/profile/" + id),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
      },
    );
}

Future <void> deleteMember(String id) async{
  var response = await http.delete(
    Uri.parse("http://localhost:8000/api/profile/" + id),
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
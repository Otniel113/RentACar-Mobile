import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/booking.dart';
import '../session/session_manager.dart';
import '../models/member.dart';
import 'api_profile.dart';

Future<List<Booking>> fetchBooking(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://localhost:8000/api/booking'));
  return await compute(parseBooking, response.body);
}

List<Booking> parseBooking(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Booking>((json) => Booking.fromJson(json)).toList();
}

Future<Member> getSession() async{
  SessionManager prefs = SessionManager();
  String member_id = await prefs.getMemberID();
  return fetchProfile(member_id);
}

Future<Member> fetchProfile(String id){
  Future<Member> hasil_profile = getMemberbyID(id);
  return hasil_profile;
}

Future <void> makeBooking(int id_mobil, String nama_mobil, jenis_mobil, wisata) async {
  Member hasil_profile = await getSession();
  
  Map data = {
    'id_mobil': id_mobil.toString(),
    'nama_mobil': nama_mobil,
    'jenis_mobil': jenis_mobil,
    'wisata': wisata,
    'id_member': hasil_profile.id.toString(),
    'nama_member': hasil_profile.name,
    'status' : 'Menunggu Persetujuan',
  };

  String body = json.encode(data);
  var url = 'http://localhost:8000/api/booking';
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

Future <void> deleteBooking(String id) async{
  var response = await http.delete(
    Uri.parse("http://localhost:8000/api/booking/" + id),
    headers: {
        'Content-Type': 'application/json',
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*",
    },
  );
}
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
import '../models/mobilkecil.dart';
import 'package:http/http.dart' as http;

Future<List<MobilKecil>> fetchMobilKecil(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://localhost:8000/api/product/mobilkecil'));
  return await compute(parseMobilKecil, response.body);
}

List<MobilKecil> parseMobilKecil(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MobilKecil>((json) => MobilKecil.fromJson(json)).toList();
}

Future<List<MobilKecil>> listMobilKecil() async {
  List<MobilKecil> mobilkecil = await fetchMobilKecil(http.Client());
  return mobilkecil;
}
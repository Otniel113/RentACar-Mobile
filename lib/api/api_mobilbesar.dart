import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../models/mobilbesar.dart';

Future<List<MobilBesar>> fetchMobilBesar(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://localhost:8000/api/product/mobilbesar'));
  return await compute(parseMobilBesar, response.body);
}

List<MobilBesar> parseMobilBesar(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MobilBesar>((json) => MobilBesar.fromJson(json)).toList();
}
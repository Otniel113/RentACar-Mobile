import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../../models/minibus.dart';

Future<List<Minibus>> fetchMinibus(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://localhost:8000/api/product/minibus'));
  return await compute(parseMinibus, response.body);
}

List<Minibus> parseMinibus(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Minibus>((json) => Minibus.fromJson(json)).toList();
}
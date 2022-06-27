import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/mobilkecil.dart';
import '../models/mobilbesar.dart';
import '../models/minibus.dart';

Future<MobilKecil> getMobilKecilbyID(String id) async{
  var response = await http.get(
    Uri.parse("http://localhost:8000/api/product/mobilkecil/" + id),
    headers: {
      'Content-Type': 'application/json',
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );
  final decoded = jsonDecode(response.body) as Map<String, dynamic>;
  final get_mobil= MobilKecil.fromJson(decoded);
  return get_mobil;
}

Future<MobilBesar> getMobilBesarbyID(String id) async{
  var response = await http.get(
    Uri.parse("http://localhost:8000/api/product/mobilbesar/" + id),
    headers: {
      'Content-Type': 'application/json',
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );
  final decoded = jsonDecode(response.body) as Map<String, dynamic>;
  final get_mobil= MobilBesar.fromJson(decoded);
  return get_mobil;
}

Future<Minibus> getMinibusbyID(String id) async{
  var response = await http.get(
    Uri.parse("http://localhost:8000/api/product/minibus/" + id),
    headers: {
      'Content-Type': 'application/json',
      "accept": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
  );
  final decoded = jsonDecode(response.body) as Map<String, dynamic>;
  final get_mobil= Minibus.fromJson(decoded);
  return get_mobil;
}
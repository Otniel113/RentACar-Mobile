import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../models/mobilkecil.dart';
import 'package:http/http.dart' as http;
import 'mobilkecil_detail.dart';

Future<List<MobilKecil>> fetchMobilKecil(http.Client client) async {
  final response = await client
      .get(Uri.parse('http://localhost:8000/api/product/mobilkecil'));
  return await compute(parseMobilKecil, response.body);
}

List<MobilKecil> parseMobilKecil(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<MobilKecil>((json) => MobilKecil.fromJson(json)).toList();
}

class APIMobilKecil extends StatelessWidget {
  const APIMobilKecil({Key? key, required this.jenisKendaraan}) : super(key: key);
  final String jenisKendaraan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(jenisKendaraan),
        centerTitle: true,
      ),
      body: FutureBuilder<List<MobilKecil>>(
      future: fetchMobilKecil(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString() + ' has occured!'),
          );
        }else if (snapshot.hasData){
          return MobilKecilList(mobilkecil: snapshot.data!);
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      ),
    );
  }
}

class MobilKecilList extends StatelessWidget {
  const MobilKecilList({Key? key, required this.mobilkecil}) : super(key: key);
  final List<MobilKecil> mobilkecil;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(20),
      itemCount: mobilkecil.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(mobilkecil[index].nama_mobil),
                const Icon(Icons.directions_car, size:100),
                Text(mobilkecil[index].wisata),
                Text(mobilkecil[index].ketersediaan),
              ],
            ),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.redAccent),
                borderRadius: BorderRadius.circular(15)),
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => 
              MobilKecilDetailPage(detailKendaraan: mobilkecil[index]),
            )
            );
          },
        );
      }
    );
  }
}
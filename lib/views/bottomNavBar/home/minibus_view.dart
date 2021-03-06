import 'package:flutter/material.dart';
import '../../../models/minibus.dart';
import 'package:http/http.dart' as http;
import 'minibus_detail.dart';
import '../../../api/api_minibus.dart';

class GetMinibus extends StatelessWidget {
  const GetMinibus({Key? key, required this.jenisKendaraan}) : super(key: key);
  final String jenisKendaraan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(jenisKendaraan),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Minibus>>(
      future: fetchMinibus(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString() + ' has occured!'),
          );
        }else if (snapshot.hasData){
          return MinibusList(minibus: snapshot.data!);
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

class MinibusList extends StatelessWidget {
  const MinibusList({Key? key, required this.minibus}) : super(key: key);
  final List<Minibus> minibus;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(20),
      itemCount: minibus.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(minibus[index].nama_mobil),
                const Icon(Icons.directions_bus, size:100),
                Text(minibus[index].wisata),
                Text(minibus[index].ketersediaan),
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
              MinibusDetailPage(detailKendaraan: minibus[index]),
            )
            );
          },
        );
      }
    );
  }
}
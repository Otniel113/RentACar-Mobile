import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/mobilbesar.dart';
import 'package:http/http.dart' as http;
import 'mobilbesar_detail.dart';
import '../../../api/api_mobilbesar.dart';

class GetMobilBesar extends StatelessWidget {
  const GetMobilBesar({Key? key, required this.jenisKendaraan}) : super(key: key);
  final String jenisKendaraan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(jenisKendaraan),
        centerTitle: true,
      ),
      body: FutureBuilder<List<MobilBesar>>(
      future: fetchMobilBesar(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString() + ' has occured!'),
          );
        }else if (snapshot.hasData){
          return MobilBesarList(mobilbesar: snapshot.data!);
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

class MobilBesarList extends StatelessWidget {
  const MobilBesarList({Key? key, required this.mobilbesar}) : super(key: key);
  final List<MobilBesar> mobilbesar;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(20),
      itemCount: mobilbesar.length,
      itemBuilder: (BuildContext context, index) {
        return InkWell(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(mobilbesar[index].nama_mobil),
                const Icon(CupertinoIcons.car_detailed, size:100),
                Text(mobilbesar[index].wisata),
                Text(mobilbesar[index].ketersediaan),
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
              MobilBesarDetailPage(detailKendaraan: mobilbesar[index]),
            )
            );
          },
        );
      }
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product_detail.dart';
import '../../../api/api_mobilkecil.dart';
import '../../../models/mobilkecil.dart';
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.jenisKendaraan}) : super(key: key);
  final String jenisKendaraan;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>{
  List<String> indexKendaraan = <String>['1', '2', '3', '4', '5', '6'];
  Future<List<MobilKecil>> mobilkecil = listMobilKecil();
  
  Widget getWidget(int index){
    if (widget.jenisKendaraan == 'Mobil Kecil'){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          const Icon(Icons.directions_car, size:100),
          Text(widget.jenisKendaraan + " " + indexKendaraan[index]),
        ],
      );
    }else if (widget.jenisKendaraan == 'Mobil Besar'){
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(CupertinoIcons.car_detailed, size:100),
          Text(widget.jenisKendaraan + " " + indexKendaraan[index]),
        ],
      );
    }else{
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.directions_bus, size:100),
          Text(widget.jenisKendaraan + " " + indexKendaraan[index]),
        ],
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(widget.jenisKendaraan),
        centerTitle: true,
      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(20),
          itemCount: indexKendaraan.length,
          itemBuilder: (BuildContext context, index) {
            return InkWell(
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                // child: Text(widget.jenisKendaraan + " " + indexKendaraan[index]),
                child: getWidget(index),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.redAccent),
                    borderRadius: BorderRadius.circular(15)),
              ),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductDetailPage(detailKendaraan: widget.jenisKendaraan + " " + indexKendaraan[index])),
                );
              },
            );
          }
        ),
      ),
    );
  }
}
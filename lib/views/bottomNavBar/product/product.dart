import 'package:flutter/material.dart';
import 'product_detail.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key, required this.jenisKendaraan}) : super(key: key);
  final String jenisKendaraan;

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> indexKendaraan = <String>['1', '2', '3', '4', '5', '6'];
  final List<String> namaKendaraan = <String>['Toyota', 'Mercedez', 'Honda', 'Audi', 'Suzuki', 'BMW'];

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
                child: Text(widget.jenisKendaraan + " " + indexKendaraan[index]),
                decoration: BoxDecoration(
                    color: Colors.red[200],
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
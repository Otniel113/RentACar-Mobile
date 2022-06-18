import 'package:flutter/material.dart';


class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({Key? key, required this.detailKendaraan}) : super(key: key);
  final String detailKendaraan;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  Future <void> seeAlert() async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berhasil'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Booking telah berhasil'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text(widget.detailKendaraan),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children:[
            Text("Halaman untuk informasi lengkap dari " + widget.detailKendaraan),
            ElevatedButton(
              child: const Text('Booking'), 
              onPressed: (){
                seeAlert();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
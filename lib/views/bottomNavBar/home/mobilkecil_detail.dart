import 'package:flutter/material.dart';
import '../../../models/mobilkecil.dart';
import '../../../api/api_booking.dart';

class MobilKecilDetailPage extends StatefulWidget {
  const MobilKecilDetailPage({Key? key, required this.detailKendaraan}) : super(key: key);
  final MobilKecil detailKendaraan;

  @override
  State<MobilKecilDetailPage> createState() => _MobilKecilDetailPageState();
}

class _MobilKecilDetailPageState extends State<MobilKecilDetailPage> {
  Future <void> tersediaAlert() async{
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
                  Navigator.pushReplacementNamed(context, '/home');
                },
              ),
            ],
          );
        },
      );
    }

    Future <void> tidaktersediaAlert() async{
      return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Gagal'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Booking gagal karena tendaraan tidak tersedia'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.pop(context);
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
        title: Text(widget.detailKendaraan.nama_mobil + " - " + widget.detailKendaraan.wisata),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            const Icon(Icons.directions_car, size:100),
            Text("Nama Kendaraan = " + widget.detailKendaraan.nama_mobil),
            Text("No. Polisi = " + widget.detailKendaraan.no_polisi),
            Text("Wisata = " + widget.detailKendaraan.wisata),
            Text("Driver = " + widget.detailKendaraan.driver),
            Text("Ketersediaan = " + widget.detailKendaraan.ketersediaan),
            ElevatedButton(
              child: const Text('Booking'), 
              onPressed: (){
                if (widget.detailKendaraan.ketersediaan == "Tersedia"){
                  makeBooking(widget.detailKendaraan.id, widget.detailKendaraan.nama_mobil, "Mobil Kecil", widget.detailKendaraan.wisata);
                  tersediaAlert();
                }else{
                  tidaktersediaAlert();
                }
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
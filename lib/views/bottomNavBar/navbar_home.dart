import 'package:flutter/material.dart';
import 'home/api_mobilkecil.dart';
import 'home/api_mobilbesar.dart';
import 'home/api_minibus.dart';

class NavbarHome extends StatelessWidget{
  const NavbarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text('Pilih jenis Kendaraan'),
        InkWell(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.redAccent)),
            child: const Center(child: Text('Mobil Kecil')),
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const APIMobilKecil(jenisKendaraan: "Mobil Kecil")),
            );
          },
        ),
        InkWell(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.redAccent)),
            child: const Center(child: Text('Mobil Besar')),
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const APIMobilBesar(jenisKendaraan: "Mobil Besar")),
            );
          },
        ),
        InkWell(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.redAccent)),
            child: const Center(child: Text('Minibus')),
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>const APIMinibus(jenisKendaraan: "Minibus")),
            );
          },
        ),
      ],
    );
  }
}
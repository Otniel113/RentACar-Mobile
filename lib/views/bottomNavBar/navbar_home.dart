import 'package:flutter/material.dart';
import 'product/product.dart';

class NavbarHome extends StatefulWidget {
  const NavbarHome({Key? key}) : super(key: key);

  @override
  State<NavbarHome> createState() => _NavbarHomeState();
}

class _NavbarHomeState extends State<NavbarHome> {

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
              MaterialPageRoute(builder: (context) => const ProductPage(jenisKendaraan: 'Mobil Kecil')),
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
              MaterialPageRoute(builder: (context) => const ProductPage(jenisKendaraan: 'Mobil Besar')),
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
              MaterialPageRoute(builder: (context) => const ProductPage(jenisKendaraan: 'Minibus')),
            );
          },
        ),
      ],
    );
  }
}
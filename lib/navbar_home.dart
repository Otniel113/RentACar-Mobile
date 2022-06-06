import 'package:flutter/material.dart';

class NavbarHome extends StatefulWidget {
  const NavbarHome({Key? key}) : super(key: key);

  @override
  State<NavbarHome> createState() => _NavbarHomeState();
}

class _NavbarHomeState extends State<NavbarHome> {
  Future <void> seeAlert(judul) async{
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(judul),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(judul + ' is clicked'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Text('Pilih jenis Kendaraan'),
        ),
        InkWell(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(20.0),
            decoration:
                BoxDecoration(border: Border.all(color: Colors.redAccent)),
            child: const Center(child: Text('Mobil Kecil')),
          ),
          onTap: (){
            seeAlert('Mobil Kecil');
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
            seeAlert('Mobil Besar');
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
            seeAlert('Minibus');
          },
        ),
      ],
    );
  }
}
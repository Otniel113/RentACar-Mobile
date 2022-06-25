import 'package:flutter/material.dart';

class NavbarBooking extends StatefulWidget {
  const NavbarBooking({Key? key}) : super(key: key);

  @override
  State<NavbarBooking> createState() => _NavbarBookingState();
}


class _NavbarBookingState extends State<NavbarBooking> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const ListTile(
              leading: Icon(Icons.car_rental_rounded),
              title: Text('Toyota Avanza'),
              subtitle: Text('Tangkuban Perahu\nD 1111 AAA'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                 TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Toyota Avanza'),
          content: const Text(''+
          'Plat Mobil : D 1111 AAA\n'+
          'Tujuan : Tangkuban Perahu\n'+
          'Driver : Garok\n'+
          'Tgl Pinjam : dd/mm/yy hh/mm/ss\n'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Detail Booking'),
    ),
            
              
                
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
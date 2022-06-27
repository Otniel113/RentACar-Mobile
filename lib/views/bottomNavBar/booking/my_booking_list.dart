import 'package:flutter/material.dart';
import 'package:rent_a_car/api/api_booking.dart';
import '../../../models/mobilkecil.dart';
import '../../../models/mobilbesar.dart';
import '../../../models/minibus.dart';
import '../../../models/booking.dart';
import '../../../api/api_get_mobil_booking.dart';

class MyBookingList extends StatefulWidget {
  const MyBookingList({Key? key, required this.my_booking_list}) : super(key: key);
  final List<Booking> my_booking_list;

  @override
  State<MyBookingList> createState() => _MyBookingListState();
}

class _MyBookingListState extends State<MyBookingList>{

  Future <void> alertDetail(Booking bookingan) async{
    String no_polisi, driver, wisata, tgl_pemesanan;

    if (bookingan.jenis_mobil == "Mobil Kecil"){
      MobilKecil mobil_kecil = await getMobilKecilbyID(bookingan.id_mobil);
      no_polisi = mobil_kecil.no_polisi;
      driver = mobil_kecil.driver;
      wisata = mobil_kecil.wisata;
      tgl_pemesanan = mobil_kecil.created_at;
    }else if (bookingan.jenis_mobil == "Mobil Besar"){
      MobilBesar mobil_besar = await getMobilBesarbyID(bookingan.id_mobil);
      no_polisi = mobil_besar.no_polisi;
      driver = mobil_besar.driver;
      wisata = mobil_besar.wisata;
      tgl_pemesanan = mobil_besar.created_at;
    }else{
      Minibus minibus = await getMinibusbyID(bookingan.id_mobil);
      no_polisi = minibus.no_polisi;
      driver = minibus.driver;
      wisata = minibus.wisata;
      tgl_pemesanan = minibus.created_at;
    }

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(bookingan.nama_mobil),
        content: Text(''+
        'No. Polisi : ' + no_polisi  + '\n'+
        'Wisata : ' + wisata + '\n'+
        'Driver : ' + driver + '\n'+
        'Tgl Pinjam : ' + tgl_pemesanan + '\n'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context, 'OK'),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> alertHapus(Booking bookingan) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Apakah Anda yakin akan cancel booking?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Iya'),
              onPressed: () {
                deleteBooking(bookingan.id_mobil);
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
            TextButton(
              child: const Text('Tidak'),
              onPressed: (){
                Navigator.of(context).pop();
              }
            ),
          ],
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: widget.my_booking_list.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.car_rental_rounded),
                  title: Text('Status: ' +  widget.my_booking_list[index].status ),
                  subtitle: Text(widget.my_booking_list[index].jenis_mobil + ' - ' + widget.my_booking_list[index].nama_mobil + '\n' + widget.my_booking_list[index].wisata),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      onPressed: (){
                        alertDetail(widget.my_booking_list[index]);
                      },
                      child: const Text('Detail Booking'),
                    ),
                    const SizedBox(width: 8),
                    TextButton(
                      onPressed: (){
                        alertHapus(widget.my_booking_list[index]);
                      },
                      child: const Text('Cancel Booking', style: TextStyle(color: Colors.red)),
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
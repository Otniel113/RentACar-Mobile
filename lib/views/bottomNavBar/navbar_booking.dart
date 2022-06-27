import 'package:flutter/material.dart';
import '../../models/booking.dart';
import '../../session/session_manager.dart';
import '../../api/api_booking.dart';
import 'package:http/http.dart' as http;
import 'booking/my_booking_list.dart';

Future<String> getSession() async{
  SessionManager prefs = SessionManager();
  String member_id = await prefs.getMemberID();
  return member_id;
}

class NavbarBooking extends StatelessWidget {
  const NavbarBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Booking>>(
      future: fetchBooking(http.Client()),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString() + ' has occured!'),
          );
        }else if (snapshot.hasData){
          return MyBooking(booking_list: snapshot.data!);
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

class MyBooking extends StatelessWidget {
  const MyBooking({Key? key, required this.booking_list}) : super(key: key);
  final List<Booking> booking_list;

  @override
  Widget build(BuildContext context) {
    List<Booking> my_booking_list = [];

    return FutureBuilder<String>(
      future: getSession(),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString() + ' has occured!'),
          );
        }else if (snapshot.hasData){
          for (var i=0; i<booking_list.length; i++){
            if (booking_list[i].id_member == snapshot.data!){
              my_booking_list.add(booking_list[i]);
            }
          }
          if (my_booking_list.isNotEmpty){
            my_booking_list = my_booking_list.reversed.toList();
            return MyBookingList(my_booking_list: my_booking_list);
          }else{
            return const Center(
              child: Text('Anda belum melakukan pemesanan'),
            );
          }
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
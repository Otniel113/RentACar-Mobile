import 'package:flutter/material.dart';

class NavbarBooking extends StatefulWidget {
  const NavbarBooking({Key? key}) : super(key: key);

  @override
  State<NavbarBooking> createState() => _NavbarBookingState();
}

class _NavbarBookingState extends State<NavbarBooking> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Halaman Booking',
    );
  }
}
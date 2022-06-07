import 'package:flutter/material.dart';

class NavbarProfile extends StatefulWidget {
  const NavbarProfile({Key? key}) : super(key: key);

  @override
  State<NavbarProfile> createState() => _NavbarProfileState();
}

class _NavbarProfileState extends State<NavbarProfile> {
  @override
  Widget build(BuildContext context) {
    return const Text(
      'Halaman Profile',
    );
  }
}
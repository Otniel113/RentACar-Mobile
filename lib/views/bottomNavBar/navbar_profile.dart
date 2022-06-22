import 'package:flutter/material.dart';
import 'profile/profile_detail.dart';
import 'dart:async';
import '../../session/session_manager.dart';
import '../../api/api_logout.dart';

class NavbarProfile extends StatefulWidget {
  const NavbarProfile({Key? key}) : super(key: key);

  @override
  State<NavbarProfile> createState() => _NavbarProfileState();
}

class _NavbarProfileState extends State<NavbarProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  printMemberID(){
    SessionManager prefs = SessionManager();
    Future<String> member_id = prefs.getMemberID();
    String kembalian ='';
    member_id.then((data) {
      print("ID Member Sekarang = "+ data);
      kembalian = data;
    },onError: (e) {
      print( "Error " + e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          const Icon(Icons.person,size: 150 ,),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              enabled: false,
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'James',
              ),
              style:TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              enabled: false,
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'James@gmail.com',
              ),
              style:TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          // Text(
          //   doSomething(),
          // ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ElevatedButton(
              child: const Text('Edit'),
              onPressed: () {
                printMemberID();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          const ProfilePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[700],
              ),
            )
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                printMemberID();
                logoutUser();
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
              ),
            )
          ),
        ],
      ),
    );
  }
}
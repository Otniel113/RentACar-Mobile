import 'package:flutter/material.dart';
import 'profile/profile_detail.dart';
class NavbarProfile extends StatefulWidget {
  const NavbarProfile({Key? key}) : super(key: key);

  @override
  State<NavbarProfile> createState() => _NavbarProfileState();
}

class _NavbarProfileState extends State<NavbarProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
          Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Edit'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const ProfilePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[900],
                ),
              )),
        ],
      ),
    );
  }
}

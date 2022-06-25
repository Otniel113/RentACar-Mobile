import 'package:flutter/material.dart';
import 'profile_detail.dart';
import '../../../api/api_logout.dart';
import '../../../models/member.dart';
import '../../../api/api_profile.dart';

class ProfileData extends StatefulWidget {
  const ProfileData({Key? key, required this.profile_data}) : super(key: key);
  final Member profile_data;

  @override
  State<ProfileData> createState() => _ProfileDataState();
}

class _ProfileDataState extends State<ProfileData>{
  
  @override
  Widget build(BuildContext context){
    
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          const Icon(Icons.person,size: 150 ,),
          const Text("Nama"),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.profile_data.name,
              ),
              style:TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          const Text("E-mail"),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: widget.profile_data.email,
              ),
              style:TextStyle(fontWeight: FontWeight.bold)
            ),
          ),
          const Text("Username"),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              enabled: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: widget.profile_data.username,
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
                          ProfilePage(id_member: widget.profile_data.id.toString())),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.orange[400],
              ),
            )
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: ElevatedButton(
              child: const Text('Logout'),
              onPressed: () {
                logoutUser();
                Navigator.pushReplacementNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
              ),
            ),
          ),
        ],
        ),
      );
  }
}
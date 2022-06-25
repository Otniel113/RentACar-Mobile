import 'package:flutter/material.dart';
import 'dart:async';
import '../../session/session_manager.dart';
import '../../api/api_profile.dart';
import '../../models/member.dart';
import '../../api/api_logout.dart';
import 'profile/profile_data.dart';

class NavbarProfile extends StatelessWidget  {
  const NavbarProfile({Key? key}) : super(key: key);

  Future<Member> fetchProfile(String id){
    Future<Member> hasil_profile = getMemberbyID(id);
    return hasil_profile;
  }

  Future<Member> getSession() async{
    SessionManager prefs = SessionManager();
    String member_id = await prefs.getMemberID();
    return fetchProfile(member_id);
  }

  @override
  Widget build(BuildContext context) {    
    return FutureBuilder<Member>(
      future: getSession(),
      builder: (context, snapshot) {
        if (snapshot.hasError){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text(snapshot.error.toString() + ' has occured!'),
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
        }else if (snapshot.hasData){
          return ProfileData(profile_data: snapshot.data!);
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      );
  }
}
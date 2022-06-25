import 'package:flutter/material.dart';
import 'package:rent_a_car/api/api_profile.dart';
import '../../../session/session_manager.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key, required this.id_member}) : super(key: key);
  final String id_member;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> alertSave() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Berhasil'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Profile telah diperbarui'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> alertHapus(String id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Apakah Anda yakin akan menghapus akun?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Iya'),
              onPressed: () {
                deleteMember(id);
                Navigator.pushReplacementNamed(context, '/');
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.red[900], title: const Text('Edit Profile')),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            const Icon(Icons.person,size: 150 ,),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Nama'),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Username'),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton(
                child: const Text('Save'),
                onPressed: () {
                  editMember(widget.id_member, nameController.text, emailController.text, usernameController.text, passwordController.text);
                  alertSave();
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
              child: const Text('Hapus'),
              onPressed: () {
                alertHapus(widget.id_member);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red[900],
              ),
            )
          ),
          ],
        ),
      ),
    );
  }
}

import 'package:artistcommerce/pages/login_page.dart';
import 'package:artistcommerce/services/firebase_services.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title:
            const Text('Profile Page', style: TextStyle(color: Colors.black)),
      ),
      body: Center(
          child: MaterialButton(
        color: Colors.blue,
        onPressed: () {
          FirebaseService.signOutFromGoogle();
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginPage()));
        },
        child: const Text(
          "Logout",
          style: TextStyle(color: Colors.white),
        ),
      )),
    );
  }
}

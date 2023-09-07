import 'package:firebase/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MYPage extends StatefulWidget {
  const MYPage({super.key});

  @override
  State<MYPage> createState() => _MYPageState();
}

class _MYPageState extends State<MYPage> {
  final User? _authUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _authUser == null
          ? const LoginPag()
          : GestureDetector(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
              },
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("login 한 사용자 ${_authUser!.email}"),
                    Text("login 한 사용자 ${_authUser!.uid}")
                  ],
                ),
              ),
            ),
    );
  }
}

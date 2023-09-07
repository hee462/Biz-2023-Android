// ignore_for_file: use_build_context_synchronously

import 'package:firebase/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MYPage extends StatefulWidget {
  const MYPage(
      {super.key, required this.authUser, required this.updateAuthUser});

  final Function(User? user) updateAuthUser;
  final User? authUser;
  @override
  State<MYPage> createState() => _MYPageState();
}

class _MYPageState extends State<MYPage> {
  final User? _authUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("mypage"),
        actions: [
          IconButton(
              onPressed: () async {
                Navigator.of(context).pop(false);
                await FirebaseAuth.instance.signOut();
                widget.updateAuthUser(null);
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
          child: widget.authUser != null
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("login 한 사용자 ${_authUser!.email}"),
                    Text("login 한 사용자 ${_authUser!.uid}")
                  ],
                )
              : SimpleDialog(
                  title: const Text(
                    "로그인이 필요한 서비스입니다",
                    style: TextStyle(fontSize: 20, color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                      child: ElevatedButton(
                          // Navigator.push( ): 현재 화면 위에 새로운 화면을 올리기
                          // 새로 push 된 화면에서 pop을 실행하면 현재 화면 나타남
                          // Navigator.pushReplacement : 현재 화면을 pop한 후에
                          // 새로운 화면을 push 새로 push된 화면에 pop을 실해하면 이전 화면 나타남
                          onPressed: () async {
                            var result = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginPag(
                                  updateAuthUser: widget.updateAuthUser,
                                ),
                              ),
                            );
                            if (result) {
                              Navigator.pop(context);
                            }
                          },
                          child: const Text("로그인")),
                    )
                  ],
                )),
    );
  }
}

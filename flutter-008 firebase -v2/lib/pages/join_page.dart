// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/modules/input_form_field.dart';
import 'package:firebase/modules/validate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({
    super.key,
    required this.updateAuthUser,
  });
  // State<> 클래스 위젯에 함수를 전달하기 위하여 선언
  final Function(User? user) updateAuthUser;
  @override
  State<StatefulWidget> createState() => _JoinPage();
}

class _JoinPage extends State<JoinPage> {
  // TextFormField에서 사용하는 작은 InputController
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _nameFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  String _emailValue = "";
  String _passwordValue = "";
  String _nameValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("join"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 이메일
              inputformField(
                  focusNode: _emailFocus,
                  validator: (value) => CheckValidate()
                      .emailCheck(email: value!, focusNode: _emailFocus),
                  setValue: (value) => _emailValue = value,
                  hintText: "이메일",
                  helperText: "이메일을 형식에 맞게 입력해주세요"),
              // 패스워드
              inputformField(
                focusNode: _passwordFocus,
                hintText: "비밀번호",
                helperText: "비밀번호는 ,특수문자,영문자,숫자 포함 8자 이상으로 입력하세요",
                setValue: (value) => _passwordValue = value,
                validator: (value) => CheckValidate()
                    .passwordCheck(password: value!, focusNode: _emailFocus),
              ),
              //login
              //회원가입
              inputformField(
                focusNode: _nameFocus,
                setValue: (value) => _nameValue = value,
                validator: (value) => null,
                hintText: "성명",
              ),
              joinButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget joinButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onPressed: () async {
          _formKey.currentState?.validate();
          try {
            var result =
                await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: _emailValue,
              password: _passwordValue,
            );
            widget.updateAuthUser(result.user);
            // email,password 이외의 회원정보를 저장하려면 firestroe에 저장해주어야 한다
            if (result.user != null) {
              await FirebaseFirestore.instance
                  .collection("user")
                  .doc(result.user!.uid)
                  .set({
                "email": result.user!.email,
                "name": _nameValue,
                "tel": "010-0000-0000"
              });
            }
          } on FirebaseException catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(e.message!),
            ));
          }
        },
        child: const SizedBox(
          width: double.infinity,
          child: Text(
            "회원가입",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
    required this.updateAuthUser,
  });
  // main.dart 에 선언된 _authUser 변수를 update 할 함수 사용할 준비
  final Function(User? user) updateAuthUser;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailInputFocus = FocusNode();
  final _passwordInputFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  String _emailValue = "";
  String _passwordValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "로그인필요합니다",
              style: TextStyle(fontSize: 20),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    focusNode: _emailInputFocus,
                    onChanged: (value) => _emailValue = value,
                  ),
                  TextFormField(
                    focusNode: _passwordInputFocus,
                    onChanged: (value) => _passwordValue = value,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(20)),
                        onPressed: () async {
                          try {
                            if (_formKey.currentState!.validate()) {
                              // 로그인에 성공하면 result에 사용자 정보가 담기게 된다
                              var result = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _emailValue,
                                      password: _passwordValue);
                              // main.dart의 _authUser State 에 로그인한 사용자 정보 updat 요청
                              widget.updateAuthUser(result.user);
                              // ghkauswjsghks, SnackBar 등을 화면에 표현하고자 할때 아래 코드먼저 실행
                              // BuildContext(context)가 아직 오나저히 생성되지 않거나 어떤이유로 context 가 사라질수도 있는데 사용상 주의
                              //  mounted  라는 시스템 변수가 생성되었는지 확인 한 후 context 관련 코드를 실행하라 하는 의미
                              if (!mounted) return;
                              Navigator.of(context).pop();
                            }
                          } on FirebaseAuthException {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("")));
                          }
                        },
                        child: const SizedBox(
                            width: double.infinity,
                            child: Text(
                              "login",
                              textAlign: TextAlign.center,
                            ))),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(20),
                          backgroundColor: Colors.red),
                      onPressed: () async {
                        try {
                          final GoogleSignInAccount? goolgeUser =
                              await GoogleSignIn().signIn();

                          final GoogleSignInAuthentication? googleAuth =
                              await goolgeUser?.authentication;
                          if (goolgeUser == null || googleAuth == null) {
                            if (!mounted) return;
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("구글로그인실패"),
                              ),
                            );
                          } else {
                            final credential = GoogleAuthProvider.credential(
                              accessToken: googleAuth.accessToken,
                              idToken: googleAuth.idToken,
                            );
                            // 구글이 보내준 token 이용해서 firebase에 로그인 -> oAuth2 방식의 login
                            final userCredential = await FirebaseAuth.instance
                                .signInWithCredential(credential);
                            await widget.updateAuthUser(userCredential.user);
                            if (!mounted) return;
                            Navigator.of(context).pop();
                          }
                        } catch (e) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text(e.toString())));
                        }
                      },
                      child: const SizedBox(
                        width: double.infinity,
                        child: Text("구글로그인", textAlign: TextAlign.center),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

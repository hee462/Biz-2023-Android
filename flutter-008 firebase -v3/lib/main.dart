import 'package:firebase/firebase_options.dart';
import 'package:firebase/pages/mypage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  /// Android, IOS 의 장치를 통하여 외부 네트워크를 실행하거나
  /// 장치에 부착된 카메라, GPS 등에 접근하기 위하여
  /// Flutter와 Native를 연결하는 설정

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // firebase 연결

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StratPage());
  }
}

class StratPage extends StatefulWidget {
  const StratPage({super.key});

  @override
  State<StatefulWidget> createState() => _StratPage();
}

class _StratPage extends State<StratPage> {
  // _authUser state 선언
  late User? _authUser;

  @override
  void initState() {
    // login 된 사용자유저를 firebaseauth에 전달
    _authUser = FirebaseAuth.instance.currentUser;
    super.initState();
  }

  void updateAuthUser(User? user) {
    setState(() {
      _authUser = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firebase Project"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "안녕ㅎ 안녕 ㅇㅅㅇ",
            style: TextStyle(fontSize: 35),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MYPage(
                      authUser: _authUser, updateAuthUser: updateAuthUser),
                ));
              },
              child: const Text("mypage"))
        ],
      )),
    );
  }
}

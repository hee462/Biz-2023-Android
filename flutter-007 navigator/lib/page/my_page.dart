import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/page/user_input.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<StatefulWidget> createState() => _MyPage();
}

class _MyPage extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MYPAGE"),
      ),
      body: Center(
          child: Column(
        children: [
          const Text("여기는 Mypage"),
          ElevatedButton(
              onPressed: () async {
                var userDto = User(
                  username: "변희서",
                  password: "1234",
                  nickname: "hee4462",
                  email: "hee462@hee462.com",
                  tel: "010-8080-9887",
                );
                // 받을대 비동기 방식으로 받을껏 ? 비동기식아니면 정보 잃어버릴수 있음
                var result = await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => UserInput(
                    userDto: userDto,
                  ),
                ));
                var resultStr = """
                    username = ${result.username},
                    password = ${result.password},
                    nickname = ${result.nickname},
               
                """;
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(resultStr),
                    duration: const Duration(seconds: 3),
                  ),
                );
              },
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("정보수정"),
                  ],
                ),
              ))
        ],
      )),
    );
  }
}

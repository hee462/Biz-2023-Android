import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/user.dart';
import 'package:flutter_application_1/page/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("여기는 Homepage 입니다"),
            ElevatedButton(
                onPressed: () {
                  var user = User(
                      username: "hee462",
                      password: "1234",
                      nickname: "hui",
                      email: "hee462@hee462.com",
                      tel: "010-8080-9887");
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(
                        name: "홍길동", email: "hee462@hee462.com", userDto: user),
                  ));
                },
                child: const Text("자세히보기"))
          ],
        ),
      ),
    );
  }
}

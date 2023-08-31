import 'dart:js_util';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: StartPage());
  }
}

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPage();
}

class _StartPage extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("안녕"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("홍길동"),
              accountEmail: const Text("hee462@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 168, 175, 180),
                child: Column(
                  children: [
                    Image.asset("images/title_image.jpg"),
                    const Text("hee462")
                  ],
                ),
              ),
            ),
            const ListTile(
              title: Text("전체메일"),
              leading: Icon(Icons.email),
            ),
            const Divider(
              height: 0.1,
            ),
            const ListTile(
              title: Text("받은메일함"),
              leading: Icon(Icons.inbox),
            ),
            const ListTile(
              title: Text("페이스북"),
              leading: Icon(Icons.facebook),
            ),
            const ListTile(
              title: Text("트위터"),
              leading: Icon(Icons.star),
            ),
          ],
        ),
      ),
      persistentFooterButtons: [
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.add),
          label: const Text("추가"),
          style: const ButtonStyle(
            textStyle: MaterialStatePropertyAll(
              TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
        ElevatedButton.icon(
          onPressed: () => {},
          icon: const Icon(Icons.clear),
          label: const Text("삭제"),
        )
      ],
      body: const Center(
        child: Text(
          "나의 스마트 어플",
          style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
